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

#Condicionales
#Si tengo una varias condiciones se utiliza el elseif


[int]$edad = Read-Host "Ingrese su edad"

if ($edad -ge 18) {
    Write-Host "Es mayor de edad"
}
elseif (($edad -lt 18) -And ($edad -ge 13)) {
    Write-Host "Es adolescente"
}
else {
    Write-Host "Es muy chiquito"
}

#Cuando tenemos más de 2 casos disponibles se usa el switch

switch ($edad) {
    {$edad -ge 18  }{
        Write-Host "Es mayor de edad"
        Break
    }
    {$edad -lt 18 -and $edad -gt 13}{
        Write-Host "Es adolescente"
        Break
    }
    Default {
        Write-Host "Es muy pequeño"
        Break
    }
}

$color = Read-Host "Elija un color"

switch ($color) {
    "rojo"{
        Write-Host "No puede pasar"
        Break
    } 
    "amarillo" {
        Write-Host "Espere unos segundos"
        Break
    }
    "verde"{ 
        Write-Host "Puede pasar"
        Break
    }
    default {
        Write-Host "Color no valido"
    }
}












