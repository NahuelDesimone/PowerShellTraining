Get-ADUser -Filter 'Name -like "ABEL*"' -Properties HomePage | Set-ADUser -HomePage "."


$User = Get-ADUser -Identity ADIAZ6 -Properties mail,department
$User.mail = "diaz@contoso.com"
$User.department = "Contabilidad"
Set-ADUser -Instance $User

Get-ADUser -Filter * -SearchBase 'OU=Usuarios,DC=CONTOSO,DC=local' -Properties City, Country | Set-ADUser -City "Bogota" -Country "CO"


Import-Csv .\ListUsersAD.csv | foreach-object {
Get-ADUser -Identity $_.SamAccountName -Properties userPrincipalName, Company, EmailAddress, Country | Set-ADUser -UserPrincipalName $_.uSerPrincipalName -Company $_.Company -EmailAddress $_.EmailAddress -Country $_.Country
}