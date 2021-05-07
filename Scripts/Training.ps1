$Variable = "Hola mundo"

Write-Host $Variable

$persona = @("Nahuel","Desimone",41465549,22)
Write-Host $persona
Write-Host $persona[1] #Obtengo el apellido de la Persona
Write-Host $persona[-1] #Obtengo el último elemento de un array

$persona += "Boca Juniors" #Le agrego un elemento al arreglo, en ese caso sería el club que es hincha
Write-Host $persona

#Los arrayList son como los arreglos pero no son fijos, sino que son dinámicos
#Lo que quiere decir esto es que se pueden agregar o quitar elementos sin necesidad de crear otro array

$arreglo1 = @(1,2)
$arreglo2 = @(3,4,5)
$resultado = $arreglo1 + $arreglo2

#Concatenar arrays

Write-Host @resultado

#Contains

$persona -contains "Nahuel" #Devuelve True o False si un elemnto esta contenido en un array
#-notcontains es lo mismo pero a la inversa.







