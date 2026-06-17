<#
.SYNOPSIS
    Shared helpers for the update-checker scripts.
#>

function Test-CommandExists {
    param([string]$Name)
    return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Confirm-Action {
    param([string]$Message)
    $answer = Read-Host "$Message (s/n)"
    return $answer -match '^[sSyY]'
}

function Write-Log {
    param([string]$Message, [string]$LogPath)
    $line = "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] $Message"
    Write-Host $line
    if ($LogPath) { Add-Content -Path $LogPath -Value $line }
}

Export-ModuleMember -Function Test-CommandExists, Confirm-Action, Write-Log
