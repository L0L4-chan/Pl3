# Pl3

El presente documento pretende dar a conocer la herramienta y su funcionamiento


## Table of Contents
1. [Uso](#Uso)
3. [Languaje](#Languaje)
4. [Ejemplos](#Ejemplos)


## Uso

Para la ejecucion de codigo es necesario indicar en el archivo Makefile, como prueba, el archivo a analizar con todas las operaciones que se desean ejecutar.
En caso de que se quiera ejectar por consola e introducir las lineas manualmente se debe modificar en el makefile la linea cinco sustituyendo run por run2.

La presente herramienta realiza dos tipos de operaciones, conversiones y cálculos aritiméticos simples.

Para ello se ha implementado el reconocimiento de las siguientes magnitudes:

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

Para las operaciones aritméticas se han implementado las siguientes

- Suma
- Resta
- Multiplicaciones
- Divisiones

Se analiza y ejecuta todo el archivo y se muestran los resultados por pantalla. En caso de encontrar errores estos se muestran al final de la ejecución.

Los errores léxicos aparecen en el momento en que se encuentran pudiendo afectar a los cálculos ejecutados a partir de esa línea si se utilizan operaciones encadenadas.

Los errores sintácticos o de otro tipo, (por ejemplo intentar convertir unidades de peso en unidades de divisa) se indican al finalizar la ejecución.

## Lenguaje

Para poder utilizar la herramienta conversora se debe usar la siguiente sintaxsis:

conversion X  udOrigen -> udDestino
ej:
'''
conversion 3 EUR -> JPY 
'''

En el archivo de ejemplo se muestran numerosos ejemplos de ejecución que puede reconocer el analizador léxico.

Para las unidades se pueden utilizar los siguientes lexemas:
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

Las magnitudes del sistema internacional (litro, metro y gramo) pueden utilizarse con los prefijos escalares siguientes:

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

Para simplificar el funcionamiento, el resultado se mostrara en la unidad del primer elemento de la operacion.

Si falta un elemento en la operación y esta esta incompleta aparecerá error de sintaxis sin especificar y se terminará la ejecución, pues no sera capaz de procesar una regla con elemento faltante.

