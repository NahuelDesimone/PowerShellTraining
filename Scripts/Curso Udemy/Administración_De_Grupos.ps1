New-ADGroup -Name "Comercial" -GroupScope DomainLocal -GroupCategory Security


Importar un archivo csv con los grupos: 

Import-Csv .\NewADGroup.csv | foreach-object { 
    New-ADGroup `
    -Name $_.Name `
    -SamAccountName $_.SamAccountName `
    -GroupScope $_.GroupScope `
    -GroupCategory $_.GroupCategory `
    }
    
    
Crear un grupo en una determinada OU:

New-ADGroup -Name "Secretarias" -GroupScope Global -GroupCategory Distribution -Path "OU=Grupos,DC=DESIMONE,DC=local"
