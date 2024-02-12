<#
.SYNOPSIS
    This script decodes and executes a Base64-encoded binary file.
.DESCRIPTION
    This script decodes a Base64-encoded binary file, saves it as a temporary executable file, and optionally runs it with provided flags.
.PARAMETER h
    Show help message and exit.
.PARAMETER r
    Run the executable immediately after decoding.
.PARAMETER exeFlags
    Additional flags to pass to the executable when running.
.EXAMPLE
    ./exe-from-base64.ps1 -r -exeFlags "smb -id user -p password"    
    Decodes the Base64-encoded executable and runs it with the provided flags.
#>

param (
    [switch]$h,
    [switch]$r,
    [string]$exeFlags # Additional parameter for receiving flags for the executable
)

function Show-Help {
    Write-Output @"
Usage: ./exe-from-base64.ps1 [-h] [-r] [-exeFlags <flags>]

Options:
     -h Show this help message and exit
     -r Run the exe immediately after decoding
     -exeFlags Additional flags to pass to the executable when running
"@
}

# Show help if -h switch is provided
if ($h) {
    Show-Help
    exit
}

# Base64 encoded binary content of the exe file
$encodedExe = @"
<BASE64_ENCODED_EXE>
"@

# Decode the Base64 content to binary
$binaryExe = [System.Convert]::FromBase64String($encodedExe)

if ($r) {
    # Run the exe immediately with optional flags
    $tempExePath = [System.IO.Path]::GetTempFileName() + ".exe"
    [System.IO.File]::WriteAllBytes($tempExePath, $binaryExe)
    Start-Process -FilePath $tempExePath -ArgumentList $exeFlags -NoNewWindow # Use -NoNewWindow to keep the window open
    Write-Host "Executable executed."
} else {
    # Save the binary content to a temporary file
    $tempExePath = [System.IO.Path]::GetTempFileName() + ".exe"
    [System.IO.File]::WriteAllBytes($tempExePath, $binaryExe)

    Write-Output "Binary decoded exe saved to: $tempExePath"
}

# Returning to the command line
exit
