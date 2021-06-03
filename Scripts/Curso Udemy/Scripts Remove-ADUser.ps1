Get-Command Remove-ADUser -Syntax

Remove-ADUser -Identity APENA20

Remove-ADUser -Identity AMOLIN3 -Confirm:$false


Get-ADUser -Identity AVEGA1 | Remove-ADUser 

Get-ADUser -Filter * -SearchBase "OU=Delete,OU=Usuarios,DC=CONTOSO,DC=local" | Remove-ADUser

Remove-ADUser
      [-WhatIf]
      [-Confirm]
      [-AuthType <ADAuthType>]
      [-Credential <PSCredential>]
      [-Identity] <ADUser>
      [-Partition <String>]
      [-Server <String>]