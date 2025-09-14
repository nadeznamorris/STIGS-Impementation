<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Nadezna Morris
    LinkedIn        : linkedin.com/in/nadezna-morris-ba095721b/
    GitHub          : github.com/nadeznamorris
    Date Created    : 2025-15-09
    Last Modified   : 2024-15-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-15-09
    Tested By       : Nadezna Morris
    Systems Tested  : nadezna-sentine
    PowerShell Ver. : 5.1.19041.6328

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# Set MaxSize value (in KB) - 0x8000 = 32768 KB = 32 MB
$maxSize = 0x00008000

# Base registry path
$basePath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Eventlog"

# Subkeys to configure
$logTypes = @("Application", "Security", "Setup", "System")

# Ensure base key exists
if (-not (Test-Path $basePath)) {
    New-Item -Path $basePath -Force | Out-Null
}

# Loop through each log type and apply MaxSize setting
foreach ($log in $logTypes) {
    $fullPath = Join-Path $basePath $log

    # Create subkey if it doesn't exist
    if (-not (Test-Path $fullPath)) {
        New-Item -Path $fullPath -Force | Out-Null
    }

    # Set MaxSize value
    New-ItemProperty -Path $fullPath -Name "MaxSize" -PropertyType DWord -Value $maxSize -Force | Out-Null
}

Write-Output "Registry settings applied successfully."
