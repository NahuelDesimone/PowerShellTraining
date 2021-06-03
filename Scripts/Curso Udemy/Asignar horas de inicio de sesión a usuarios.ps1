#Asignar a usuario
[byte[]]$horario=@(000,000,000,000,240,127,000,240,127,000,240,127,000,240,127,000,240,127,000,000,000)
Get-ADUser jgomez | Set-ADUser -replace @{logonhours = $horario}


#Asignar a Usuarios de OU
[byte[]]$horario=@(000,000,000,000,240,127,000,240,127,000,240,127,000,240,127,000,240,127,000,000,000)
Get-ADUser -Filter * -SearchBase "OU=Usuarios,DC=CONTOSO,DC=local" | Set-ADUser -replace @{logonhours = $horario}