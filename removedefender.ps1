echo  "Dev: ionuttbara"
echo  "Website: github.com/ionuttbara/"
echo  "Thanks for using https://github.com/archlinux-dev/win10!"

Invoke-WebRequest -Uri "https://github.com/ionuttbara/windows-defender-remover/releases/download/release13-rev1/Defender.Remover.13.exe" -OutFile "$env:TEMP\Defender.Remover.13.exe"
Start-Process "$env:TEMP\Defender.Remover.13.exe" -Verb RunAs
