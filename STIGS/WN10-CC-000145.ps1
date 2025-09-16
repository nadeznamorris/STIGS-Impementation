<#
.SYNOPSIS
    This PowerShell script ensures the user is prompted for a password on resume from sleep (on battery).

.NOTES
    Author          : Nadezna Morris
    LinkedIn        : linkedin.com/in/nadezna-morris-ba095721b/
    GitHub          : github.com/nadeznamorris
    Date Created    : 2025-15-09
    Last Modified   : 2025-16-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000145

.TESTED ON
    Date(s) Tested  : 2025-15-09
    Tested By       : Nadezna Morris
    Systems Tested  : nadezna-sentine
    PowerShell Ver. : 5.1.19041.6328

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000145.ps1 
#>

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
$valueName = "DCSettingIndex"
$valueData = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "Registry key and value have been set successfully."
