# Pl3

El presente documento pretende dar a conocer la herramienta y su funcionamiento


## Table of Contents
1. [Uso](#Uso)
3. [Languaje](#Languaje)
4. [Ejemplos](#Ejemplos)


## Uso

Para la ejecucion de codigo es necesario indicar en el archivo Makefile, como prueba el archivo a analizar.

O si se quiere ejectar por consola e introducir las lineas manualmente modificar en el makefile la linea cinco sustituyendo run por run2.

La presente herramienta realiza dos tipos de operaciones:

Conversiones

Maneja las siguientes escalas:

De distancia:
- metro 
- yarda
- pie 
- milla 

De divisa
- euro
- dolar
- gbp
- yen

De peso
- gramo
- libra
- onza
- piedra

De capacidad
- litro
- pinta
- galon
- barril

Operaciones aritmeticas simples 

- Suma
- Resta
- Multiplicaciones
- Divisiones

Se analizara y ejecutara todo el archivo y se mostrara los resultados por pantalla y al final del archivo se mostraran los errores encontrados.

Si se comente un error lexico, ell error aparecera cuando se haya encontrado y podra influir en los resultados que se calculen a partir de la linea donde ocurra.

si se comente un error sintactico o de otro tipo, (por ejemplo intentar convertir unidades de peso en unidades de divisa) el error se indicara al finalizar la ejecución.

## Lenguaje

Para poder utilizar la herramienta conversora se debera usar la siguiente sintaxsis:

conversion X  udOrigen -> udDestino
ej:
'''
conversion 3 EUR -> JPY 
'''
Para las unidades utilizaremos los siguientes lexemas:
- metro -> metro
- yarda -> yarda
- pie -> pie
- milla  -> milla
- euro -> EUR
- dolar -> USD
- gbp  -> GBP
- yen  -> JPY
- gramo -> gramo
- libra -> libra
- onza -> onza
- piedra -> piedra
- litro  -> litro
- pinta -> pinta
- galon -> galon
- barril  -> barril

Las medidas de litro, metro y gramo podran ir acompañadas de prefijos:

- mili    
- deci   
- deca   
- centi  
- kilo   
- hecto   


Para el uso de operaciones aritméticas entre unidades de medidas usaremos la siguiente sintaxis:

 calculo X und1 ope Y und2
 calculo 3 miligramo + 5 onza

las operaciones aceptadas son:
- Suma  -> +
- Resta -> -
- Multiplicaciones -> *
- Divisiones ->/

El resultado se mostrara en la unidad del primer elemento de la operacion