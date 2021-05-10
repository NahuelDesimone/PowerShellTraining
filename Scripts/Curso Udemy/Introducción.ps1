Write-Host "Hola mundo"

#Powershell está constituido por modulos,  dentro de estos módulos nosotros vamos a tener los cmdlets

Get-Command -Module NetNat
#Con Get-Command -Module nombreModulo podemos ver todos los cmdlets que forman parte de nombreModulo

Update-Help 
#Sirve para actualizar la informacion de ayuda de todos los modulos

Get-Help -Name Get-DnsClient
#Con Get-Help -Name nombreCmdlet podemos ver la ayuda que nos da acerca de ese cmdlet, donde nos muestra para que se usa

Get-Help -Name Add-Computer -Online
#Al agregarle el párametro -Online nos redirige a la página oficila de Microsoft donde nos muestra la ayuda

Test-Connection 8.8.8.8 
#Con el cmdlet Test-Connection hacemos un ping a una direción IP








