Import-Csv .\AddUsersGroup.csv | foreach-object { 
Add-ADGroupMember `
-Identity $_.Group `
-Members $_.Members
}