Get-ADUser 
#Va a ser el comando que mas voy a utilizar para operar con usuarios en el Active Directory
#Me devuelve algunas de las propiedades más importantes de un usuario


#Busqueda de usuarios por filtros

Get-ADUser -Filter 'samAccountName -like "N*"'
#Me trae todos los usuario de los cuales su samAccountName arranca con N

Get-ADUser -Filter {Name -eq "Nahuel Desimone"}
#Me trae el usuario cuyo nombre es Nahuel Desimone

Get-ADUser -Filter 'Surname -like "D*"'
#Me trae todos los suarios que su apellido arranca con D

Get-ADUser -Identity nahuel 
Get-ADUser nahuel
#En caso que me sepa el nombre exacto del usuario no hace falta que use el -Filter, lo puedo buscar así

Get-ADUser -Identity nahuel -Properties *
#Me devuelve TODAS las propiedades de un usuario, en este caso del usuario nahuel

Get-ADUser -Identity nahuel -Properties * | Format-Table Name, samAccountName, UserPrincipalName
#Me devuelve solo las propiedades Name, samAccountName y UserPrincipalName del usuario nahuel en formato tabla

Get-ADUser -Filter 'Name -like "Nahuel*"' nombreUsuario -SearchBase nombreUnidadOrganizativa 
#En caso que tenga dos personas que se llaman igual puedo filtrarlos por la unidad Organiativa a la que pertenecen
#En este caso si hay varios nahueles, me va a trar solo el usuario nahuel que trabaja en nombreUnidadOrganizativa


Get-ADUser -Filter 'Name -like "Na*"' -Properties Name, SamAccountName -Server UDWS2019.DESIMONE.local
#El parametro -Server sirve en los casos de empresas que tienen mas de 1 controlador de dominio
#Con este comando vamos a filtrar a un usuario cuyo nombre arranca con Na y que pertenece al controlador de dominio que 
#se especifica en -Server


Get-ADUser -Filter * | Export-Csv usuariosAD.csv
#Me trae las propiedades básicas de todos los usuarios  y los exporta a un archivo csv

Get-ADUser -Filter * | Select Name, samAccountName | Export-CSV nombreYSamAccount.csv
#Me trae solo las propuedades Name y samAccountName de todos los usuarios y los exporta a un archivo csv

Get-ADUser -Filter 'Name like "*admi*"' | %{
    ($variable | Get-ADObject -Properties lastLogon).lastLogon
    $dt = [DateTime]::FromFileTime(($variable | Get-ADObject $variable -Properties lastLogon).lastLogon)
    Write-Host $variable "El ultimi inicio de sesion fue: " $dt
}

#Obtengo la hora del último inicio de sesion del usuario administradpor

Get-ADUser nahuel.desimone -Properties whenCreated

#Obtengo la fecha de creación del usuario nahuel.desimone

Las cuentas deshabilitadas NO necesitan una cuenta para poder ser creadas
Para crear una cuenta habilitada hay que agregar el parametro -Enabled $true
Hay un parametros que es necesario y obligatorios para crear una cuenta habilitada, estos es el de Account Password

Como es de tipo SecureString hay que poner el ConvertTo-SecureString para castearlo

New-ADUser -Name "Sofia Gomez" -Enabled $true -AccountPassword (ConvertTo-SecureString "P@ssword1" -AsPlainText -Force) 

#Se puede agregar un usuario con la cantidad de parametros que yo quiera
New-ADUser `
-DisplayName "Leandro Paredes"`
-Name "Leandro" `
-GivenName "Leo Paredes" `
-Surname "Paredes" `
-SamAccountName "leo.paredes"`
-Type "User"  -Department "Jugadores"`
-AccountPassword(ConvertTo-SecureString "P@ssword1" -AsPlainText -Force) `
-Enabled $true

New-ADUser `
-DisplayName "NeymarJr"`
-Name "Neymar" `
-GivenName "Ney" `
-Surname "JR" `
-SamAccountName "neymar.juniors"`
-Type "User"  -Department "Jugadores"`
-Path "OU=Jugadores,DC=DESIMONE,DC=local"` #Le seteo la Unidad Organtizativa en donde lo quiero crear
-ChangePasswordAtLogon $true ` #Le seteo que cambie la contraseña en el proximo inicio de sesión
-AccountPassword(ConvertTo-SecureString "P@ssword1" -AsPlainText -Force) `
-Enabled $true

Set-ADUser sirve para modificar los parámetros de los usuarios ya creados

Set-ADUser -Identity "neymar.juniors" -HomePage "https://google.com" -Office "Sistemas" 
En este caso se puede ver que busco al usuario por su identity (samAccountName) y le modifico los parametros que quiera

$usuario = Get-ADUser -Identity "neymar.juniors" -Properties HomePage, Office
$usuario.HomePage = "udemy.com"
$usuario.Office = "Finanzas"

Set-ADUser -Instance $usuario

Unlock-ADAccount -Identity 'Carlos Gomez' #Sirve para desbloquear usuarios bloqueados




