﻿Import-Csv .\ListUsersAD.csv | foreach-object { 
New-ADUser `