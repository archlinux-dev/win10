echo  "archlinux-dev/win10 Multitool"
echo  "Thanks for using https://github.com/archlinux-dev/win10!"
echo  "We do not own the bundled scripts - see README.md for credits"

$RawBase = "https://raw.githubusercontent.com/archlinux-dev/win10/main"

$Tools = [ordered]@{
  "1" = @{ Name = "Activate Windows (massgrave)";      Script = "Activ-Win.ps1" }
  "2" = @{ Name = "Remove Edge (ionuttbara / AveYo)";  Script = "Remove-Edge.ps1" }
  "3" = @{ Name = "Optimize-10 / WinUtil (Chris Titus)"; Script = "Optimize-10.ps1" }
}

function Show-Menu {
  Write-Host ""
  Write-Host "==== win10 Multitool ====" -ForegroundColor Cyan
  foreach ($key in $Tools.Keys) {
    Write-Host " [$key] $($Tools[$key].Name)"
  }
  Write-Host " [0] Exit"
  Write-Host ""
}

function Invoke-Tool {
  param([string]$ScriptName)
  $url = "$RawBase/$ScriptName"
  Write-Host "Running $ScriptName ..." -ForegroundColor Yellow
  try {
    Invoke-Expression (Invoke-RestMethod -Uri $url)
  } catch {
    Write-Host "Failed to run ${ScriptName}: $_" -ForegroundColor Red
  }
}

do {
  Show-Menu
  $choice = Read-Host "Select an option"
  if ($choice -eq "0") {
    break
  } elseif ($Tools.Contains($choice)) {
    Invoke-Tool -ScriptName $Tools[$choice].Script
  } else {
    Write-Host "Invalid option." -ForegroundColor Red
  }
} while ($true)
