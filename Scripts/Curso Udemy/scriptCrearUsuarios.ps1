En este script se va a poder crear usuarios que pertenezcan a la Unidad Organizativa "Jugadores"
También se podria crear una variable que sea unidadOrganizativa que pida por pantalla la OU


$nombre = Read-Host -Prompt "Ingrese el nombre de usuario"
$apellido = Read-Host -Prompt "Ingrese el apellido del usuario"

New-ADUser `
-DisplayName "$nombre $apellido"`
-Name "$nombre" `
-GivenName "Ney" `
-Surname "$apellido" `
-SamAccountName "$nombre.$apellido"`
-Type "User"  -Department "Jugadores"`
-Path "OU=Jugadores,DC=DESIMONE,DC=local"`
-ChangePasswordAtLogon $true `
-AccountPassword(ConvertTo-SecureString "P@ssword1" -AsPlainText -Force) `
-Enabled $true


