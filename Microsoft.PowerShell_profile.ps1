Import-Module oh-my-posh
Import-Module -Name Terminal-Icons
#Set-PoshPrompt -Theme free-ukraine
# Adjust path to profile according to your theme file location
oh-my-posh --init --shell pwsh --config C:/Users/<username>/AppData/Local/oh-my-posh/themes/sitecore.omp.json | Invoke-Expression

# Add PSReadLine
# https://github.com/PowerShell/PSReadLine
# https://devblogs.microsoft.com/powershell/announcing-psreadline-2-1-with-predictive-intellisense/
# https://docs.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-7.2
#--------------------
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Custom styling of the PSReadLine ListView
Set-PSReadLineOption -Colors @{
  ListPrediction = '#333378'
  Emphasis = '#02999A'
}

#Get-PSReadLineOption
#Set-PSReadLineOption -Colors @{
#  ListPredictionColor = 'Blue'
#  ListPredictionSelectedColor = 'Purple'
#  Command            = 'Magenta'
#  Comment          = ''
#  ContinuationPrompt = ''
#  DefaultToken       = ''
#  Emphasis           = ''
#  Error              = ''
#  InlinePrediction   = ''
#  Keyword            = ''
#  ListPrediction     = ''
#  ListPredictionSelected = ''
#  Selection          = ''
#  String             = ''
#  Number             = 'DarkGray'
#  Member             = 'DarkGray'
#  Operator           = 'DarkGray'
#  Type               = 'DarkGray'
#  Variable           = 'DarkGreen'
#  Parameter          = 'DarkGreen'
#  ContinuationPrompt = 'DarkGray'
#  Default            = 'DarkGray'
#}

# Add support for dotnet suggest shell start
#-------------------------------------------

function Add-Autocomplete {
    param (
        [string[]] $arguments,
        [string[]] $commandName,
        [int] $cursorPosition,
        [System.Management.Automation.Language.CommandAst] $commandAst
    )
    $firstELement = $commandAst.CommandElements[0];
    $commandToExecute = "$firstELement $commandName [suggest:$cursorPosition] ""$arguments"""
    $listOfSuggestions = Invoke-Expression $commandToExecute
   
    $lastArgument = $arguments.Split(" ", [System.StringSplitOptions]::RemoveEmptyEntries) | Select-Object -Last 1

 

    $resultArray = @();
       
    if ($lastArgument) {
        $listOfSuggestions | ForEach-Object {
            if ($_.StartsWith($lastArgument)) {
                $resultArray += $_
            }
        }
    }

 

    if ($resultArray.Count -eq 0) {
        $resultArray = $listOfSuggestions
    }

 

    $resultArray | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}

 

# local Tool autocomplete
Register-ArgumentCompleter -Native -CommandName "dotnet" -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

 

        $arguments = $commandAst.Extent.ToString().Replace('"', '\"')
        $commandName = "sitecore"
        if ($arguments.Contains($commandName)) {
            Add-Autocomplete -arguments $arguments -commandName $commandName -commandAst $commandAst -cursorPosition $cursorPosition
        }

 

        # Root command autocomplete
        if ($commandName.StartsWith($commandAst.CommandElements[1])) {
            [System.Management.Automation.CompletionResult]::new($commandName, $commandName, 'ParameterValue', $commandName)
        }

 

}    

 

# Global Tool autocomplete
Register-ArgumentCompleter -Native -CommandName  "sitecore" -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

 

    $arguments = $commandAst.Extent.ToString().Replace('"', '\"')
    Add-Autocomplete -arguments $arguments -commandAst $commandAst -cursorPosition $cursorPosition
}