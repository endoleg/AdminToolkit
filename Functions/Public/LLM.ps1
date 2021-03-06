#Region LLM

<#
.SYNOPSIS
    This is a quick way to lock your workstation.
.DESCRIPTION
    LLM is to stand for 'Lock Local Machine'. This will lock the current session on a windows workstation. Will need to add functionality to lock a linux or mac.
.EXAMPLE
    PS> llm
    
    Description
    -----------
    This will quickly lock the current workstation.
.NOTES
    Author: Matthew J. DeGarmo
    Site: https://matthewjdegarmo.github.io

    You can either submit a [PR](https://github.com/matthewjdegarmo/AdminToolkit/pulls)
        or create an [Issue](https://github.com/matthewjdegarmo/AdminToolkit/issues/new)
        on this GitHub project at https://github.com/matthewjdegarmo/AdminToolkit
#>
Function llm() {
    [CmdletBinding()]
    param ()
    $signature = @"  
    [DllImport("user32.dll", SetLastError = true)]  
    public static extern bool LockWorkStation();  
"@  
    Write-Host "Locking local machine: $Env:COMPUTERNAME" -ForegroundColor Yellow
    $LockWorkStation = Add-Type -memberDefinition $signature -name "Win32LockWorkStation" -namespace Win32Functions -passthru  
    $LockWorkStation::LockWorkStation() | Out-Null
}
#EndRegion LLM