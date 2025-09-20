<#
.SYNOPSIS
    This PowerShell script ensures that it prevents any commands to autorun from executing as it may introduce malicious code to a system.

.NOTES
    Author          : Nadezna Morris
    LinkedIn        : linkedin.com/in/nadezna-morris-ba095721b/
    GitHub          : github.com/nadeznamorris
    Date Created    : 2025-16-09
    Last Modified   : 2025-16-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000185

.TESTED ON
    Date(s) Tested  : 2025-16-09
    Tested By       : Nadezna Morris
    Systems Tested  : nadezna-sentine
    PowerShell Ver. : 5.1.19041.6328

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000185.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the NoAutorun value to 1 (DWORD)
Set-ItemProperty -Path $registryPath -Name "NoAutorun" -Value 1 -Type DWord

Write-Output "Registry key 'NoAutorun' set to 1 at $registryPath"
