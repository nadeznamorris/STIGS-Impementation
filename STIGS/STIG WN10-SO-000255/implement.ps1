<#
.SYNOPSIS
    This PowerShell script enforces UAC to deny standard user elevation, ensuring only admins perform privileged tasks and reducing credential theft.

.NOTES
    Author          : Nadezna Morris
    LinkedIn        : linkedin.com/in/nadezna-morris-ba095721b/
    GitHub          : github.com/nadeznamorris
    Date Created    : 2025-20-09
    Last Modified   : 2025-20-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000255

.TESTED ON
    Date(s) Tested  : 2025-20-09
    Tested By       : Nadezna Morris
    Systems Tested  : nadezna-sentine
    PowerShell Ver. : 5.1.19041.6328

.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000255.ps1 
#>

# Registry path and value
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$regName = "ConsentPromptBehaviorUser"

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# If the property exists, update it; otherwise, create it
if (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue) {
    Set-ItemProperty -Path $regPath -Name $regName -Value 0 -Type DWord
} else {
    New-ItemProperty -Path $regPath -Name $regName -Value 0 -PropertyType DWord
}

# Confirm the setting
$setting = Get-ItemProperty -Path $regPath -Name $regName
Write-Host "ConsentPromptBehaviorUser is now set to: $($setting.ConsentPromptBehaviorUser)"

# Output the current setting to confirm
$setting = Get-ItemProperty -Path $regPath -Name $regName
Write-Host "Current setting for 'ConsentPromptBehaviorUser': $($setting.ConsentPromptBehaviorUser)"
