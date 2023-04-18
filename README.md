# Windows-Terminal-DevEx-improvements
Sitecore branded Windows Termial and VS Code Theme and Profile to unlock helpful tooling for working with XM Cloud such as autocompletion, command history list and directory improvements. However this Theme and profile is Sitecore independent and can be used with any terminal related work.

# Preconditions

## Install Windows Terminal
- Go to Microsoft Store and search for Windows Terminal
- Hit Install Button
- Launch Windows Terminal

## Install Powershell Version 7.7.2
- Go to Microsoft Store and search for Powershell
- Hit Install Button
- Restart Windows Terminal (close and open)

## Make Powershell 7.7.2 the standard shell
- Open Settings
- In Startup Selected PowerShell as your default profile

## Install Oh My Posh

- In Terminal run: `Install-Module posh-git -Scope CurrentUser`
- Confirm that you trust the repository with  `a`

- Run: `Install-Module oh-my-posh -Scope CurrentUser`
- Confirm that you trust the repository with `a`

- Run: `Install-Module -Name PSReadLine -AllowPrerelease -Force`

- Run: `Install-Module -Name Terminal-Icons -Repository PSGallery`

### Test Oh My Posh

- In Terminal run: Set-PoshPrompt (Note : You will see message with migration guide, please ignore that and keep following the next steps)

## Install Nerd Fonts
- Go to Nerdfonts.com and
- Download Caskaydia Cove Nerd Font (Reserved Font Name: Cascadia Code) - Direct link : https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/CascadiaCode.zip
- Install Fonts in zip file (Note : To install fants, drang and drop all font files to c:\Windows\Fonts folder)

- In Windows Terminal
- Go to Settings
- Go To Appearance
- Select Font face "CaskaydiaCove NF" (Note: You can also select from Profiles | Powershell | Font Face "CaskaydiaCove NFM")

### Test
- In Terminal glyphs should be shown now

## Get available Posh Themes (optional)
That step will download available Themes

- In Terminal run: `Get-PoshThemes`

## Switch Theme (optional)
- In Terminal run: `Set-PoshPrompt -Theme free-ukraine`

# Use Sitecore branded theme and profile

## Change the Theme 
- Download *sitecore.omp.json*
- Copy file to that path: C:\Users\<username>\AppData\Local\oh-my-posh\themes\ (Note : If themes folder doesn't exist, you can create it manually)

## Change the Profile
- Download *Microsoft.PowerShell_profile.ps1* from Repository
- Copy file to that path: C:\Users\<username>\Documents\PowerShell\Microsoft.Powerhsell_profile.ps1 and overwrite the extisting (if any)
- Open profile file and adjust the path to the theme according to your theme file location
