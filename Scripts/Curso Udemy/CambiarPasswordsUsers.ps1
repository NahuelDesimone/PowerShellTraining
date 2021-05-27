#Cambiar contraseña
Set-ADAccountPassword -Identity jgomez

Set-ADAccountPassword -Identity jgomez -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "P@ssword" -Force)

Get-ADUser -Filter * -SearchBase "OU=Usuarios,DC=CONTOSO,DC=local" | Set-ADAccountPassword -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "P@ssword" -Force)