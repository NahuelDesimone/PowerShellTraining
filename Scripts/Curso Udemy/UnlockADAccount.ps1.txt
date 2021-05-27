Get-Command Unlock-ADAccount -Syntax

Unlock-ADAccount -Identity jgomez

Get-ADUser -Filter * -SearchBase "OU=SISTEMAS,DC=CONTOSO,DC=local" | Unlock-ADAccount


#Script

$nombre = Read-Host -Prompt "Ingrese nombre de usuario"
Unlock-ADAccount -Identity $nombre