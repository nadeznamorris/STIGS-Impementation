<#
.SYNOPSIS
    This PowerShell script prevents users from changing installation options that may bypass security features.

.NOTES
    Author          : Nadezna Morris
    LinkedIn        : linkedin.com/in/nadezna-morris-ba095721b/
    GitHub          : github.com/nadeznamorris
    Date Created    : 2025-18-09
    Last Modified   : 2025-18-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000310

.TESTED ON
    Date(s) Tested  : 2025-18-09
    Tested By       : Nadezna Morris
    Systems Tested  : nadezna-sentine
    PowerShell Ver. : 5.1.19041.6328

.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000310.ps1 
#>

# Define a registry path
$regpath = "HKLM:\Software\Policies\Microsoft\Windows\Installer"

# Create registry path if it does not exist
if (-not (Test-Path $regpath)) {
    New-Item -Path $regpath -Force
}

# Set the EnableUserControl value to 0 (REG_DWORD)
Set-ItemProperty -Path $regpath -Name "EnableUserControl" -Value 0 -Type DWord

Write-Output "STIG value 0 has been enabled for 'EnableUserControl' in $regpath"
