Get-Help -Name Rename-Computer -Online

#Cambiar el nombre del servidor o computadora
Rename-Computer -ComputerName localhost -NewName UDWS2019 -Restart

hostname 
#Me muestra el nombre de la computadora o servidor, en mi caso NDESIMONE-NB

#Obtengo los adaptadores de red de mi computadora 
Get-NetAdapter

#Cambiar el nombre de un adaptador de red
Get-NetAdapter -Name "Ethernet 2" | Rename-NetAdapter -NewName LAN -PassThru
#Obtengo el adaptador de red que en este caso se llama "Ethernet 2", y luego se cambia el nombre por el de LAN
#El parametro -PassThru lo unico que hace es mostrar en pantalla lo que se hizo

Get-NetAdapter -Name "Ethernet 3" | Rename-NetAdapter -NewName WAN -PassThru
#Hago lo mismo que antes, en este caso el adaptador Ethernet 3 pasará a llamarse WAN


#Cambiar dirección IP al adaptador LAN
New-NetIPAddress -InterfaceAlias LAN -IPAddress "192.168.0.10" -PrefixLength 24 -DefaultGateway "192.168.0.1"
#El parámetro -InterfaceAlias se refiere al nombre del adaptadr que quiero cambiar
#El parámetro -IPAddress se refiere a la IP que le voy a asignar a ese adaptador
#El parámetro -PrefixLength se refiere a la máscara de red, en este caso es 24 que hace referencia a 255.255.255.0
#El parámetro -DefaultGateway se refiere a la puerta de enlace

#Cambiar servidores DNS
Set-DnsClientServerAddress -InterfaceAlias "LAN" -ServerAddresses 192.168.0.10
#Si quisiera agregar también un servidor DNS secundario haría lo siguiente:
Set-DnsClientServerAddress -InterfaceAlias "LAN" -ServerAddresses 192.168.0.10,8.8.8.8
#En este caso el servidor DNS principal sería el 192.168.0.10 y el secundario el 8.8.8.8 

#Deshabilitar IPV6 en el adaptador LAN, es buena práctica deshabilitarlo si no lo vamos a usar
Disable-NetAdapterBinding -Name "LAN" -ComponentID ms_tcpip6

#Instalar rol de Active Directory Domain Services
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools 

#Script de Windows Powershell para la implementación de AD Domain Services
#Este script nos sirve solamente para crear desde 0 un bosque en el AD
#Si ya tenemos configurado un AD no hace falta hacer esto
Import-Module ADDSDeployment 
Install-ADDSForest ` 
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" ` 
-DomainMode "WinThreshold" `
-DomainName "DESIMONE.local" `
-DomainNetbiosName "Desimone" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false ` 
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true

#Una vez instalado e implementado el AD con el rol de Domain Services tenemos que chequear lo siguiente:
#Si están compartidas las carpetas que deben estar compartidas, estas carpetas que deben estar compartidas
#son NETLOGON y SYSVOL

Get-SmbShare #Con este comando vemos las carpetas que están compartidas, para chequear si están SYSVOL y NETLOGON


#Verificar roles FSMO 
#Estos roles son la base estructura de un dominio Windows, y son los encargados de realiazr funciones de creacion de Usuarios, grupos, etc.
#todo esto se basa en estos 5 roles
#Estos roles son 5, 3 de ellos se encuentran en el Dominio (InfraestructureMaster, RIDMaster, PDCEmulator)
#y los otros dos en el bosque (DomainNamingMaster, SchemaMaster)

Get-ADDomain | Select-Object InfraestructureMaster, RIDMaster, PDCEmulator

Get-ADForest | Select-Object DomainNamingMaster, SchemaMaster

Get-ADDomainController -Service PrimaryDC -Discover

Get-ADDomainController -Filter * |
    Select-Object Name, Domain, Forest, OperationMasterRoles |
    ft -AutoSize

#Obtenemos todos los comandos que nos van a permitir operar en el active directory
#El pipe | ogv nos va a mostrar en tabla lo que me devuelva el primer cmdlet 

Get-Command -Module ActiveDirectory | ogv 




