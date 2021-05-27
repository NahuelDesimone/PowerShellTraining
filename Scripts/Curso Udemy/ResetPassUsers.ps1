$Cuenta = (Read-Host -Prompt "Ingrese nombre de usuario")
$NewPassword = (Read-Host -Prompt "Ingrese nueva contraseña" -AsSecureString)
Set-ADAccountPassword -Identity $Cuenta -NewPassword $NewPassword -Reset
