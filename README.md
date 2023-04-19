# Windows-Terminal-DevEx-improvements
Sitecore branded Windows Termial and VS Code Theme and Profile to unlock helpful tooling for working with XM Cloud such as autocompletion, command history list and directory improvements. However this Theme and profile is Sitecore independent and can be used with any terminal related work.

# Important Update
**Please note that the oh-my-posh module is no longer supported. If you have installed the oh-my-posh module already check this migration path documentation: https://ohmyposh.dev/docs/migrating** If you want to install oh-my-posh now for the first time, just proceed with this readme.

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
To install Oh My Posh you can check this documentation: 
- for windows: https://ohmyposh.dev/docs/installation/windows
- for mac os: https://ohmyposh.dev/docs/installation/macos
- for Linux: https://ohmyposh.dev/docs/installation/linux

### For Windows installation: 
For more details check here: https://ohmyposh.dev/docs/installation/windows 
As I do not have winget installed
- In Terminal I run: `Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))`

- Run: `Install-Module -Name PSReadLine -AllowPrerelease -Force`

- Run: `Install-Module -Name Terminal-Icons -Repository PSGallery`

### Test Oh My Posh

- In Terminal run: `Set-PoshPrompt` (Note : You will see message with migration guide, please ignore that and keep following the next steps)

## Install Nerd Fonts
- Go to Nerdfonts.com and
- Download Caskaydia Cove Nerd Font (Reserved Font Name: Cascadia Code) - Direct link : https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/CascadiaCode.zip
- Install Fonts in zip file (Note : To install fonts, drag and drop all font files to c:\Windows\Fonts folder)

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
- Download *sitecore.omp.json* from this repository 
- Copy file to that path: C:\Users\<username>\AppData\Programs\oh-my-posh\themes\ (Note : If themes folder doesn't exist, you can create it manually)

## Copy Profile
- Download *Microsoft.PowerShell_profile.ps1* from Repository
- Copy file to that path: C:\Users\<username>\Documents\PowerShell\Microsoft.Powerhsell_profile.ps1 and overwrite the extisting (if any)

# Troubleshooting

1. Check env variables
The profile file is relying on the env variable **POSH_THEMES_PATH**. This one should have been provided and filled during the installation process. The theme path should point to: C:\Users\<username>\AppData\Programs\oh-my-posh\themes. If it still does not find your theme path you can change the Microsoft.PowerShell_profile.ps1 file and use the absolute path in line 7. That should be C:\Users\<username>\AppData\Local\Programs\oh-my-posh\themes

2. Restart terminal
especially when env variable changes are made, you need to restart the terminal application.

3. Reload profile
In some cases it can be necessary to reload your profile if you do not see the right design of your command prompt. Therefore you need to reload the profile. You can run `. $profile`