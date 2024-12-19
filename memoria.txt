# Pl3

# Miembros del grupo

Míguez Valero, Ismael
Suárez González, Dolores

# Objetivo de la práctica
Calculadora para la realización de conversiones de unidades y realización de operaciones aritméticas simples.
Ambas operaciones contemplan el cálculo de resultados con magnitudes de distancia, masa, capacidad y operaciones monetarias tanto del sistema métrico internacional como del sistema anglosajón. 
Para la realización de operaciones se analizarán y convertirán las unidades a una misma escala con la que se podrá operar. 
El analizador cuenta con un sistema de reconocimiento de errores en caso de que se introduzcan datos erroneos.

El presente documento pretende dar a conocer la herramienta y su funcionamiento

# Archivos que componen la práctica.
1. Analizador léxico -> converter.l
2. Analizador sintáctico -> converter.y
3. Ejemplos de ejecución -> ejemplo1.txt
4. Ejemplos de ejecución ->  ejemplos.txt
5. Instrucciones de compilación y ejecución -> Makefile
6. Memoria del trabajo -> memoria.txt


## Table of Contents
1. [Uso](#Uso)
3. [Languaje](#Languaje)
4. [Ejemplos](#Ejemplos)


## Uso

Para la ejecucion de codigo es necesario indicar en el archivo Makefile, como prueba, el archivo a analizar con todas las operaciones que se desean ejecutar.

En caso de que se quiera ejectar por consola e introducir las lineas manualmente se debe modificar en el makefile la linea número cinco sustituyendo run por run2.

La presente herramienta realiza dos tipos de operaciones, conversiones y cálculos aritiméticos simples.

Para ello se ha implementado el reconocimiento de las siguientes magnitudes:


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

Para las operaciones aritméticas se han implementado las siguientes:

- Suma
- Resta
- Multiplicaciones
- Divisiones

Se analiza y ejecuta todo el archivo y se muestran los resultados por pantalla. En caso de encontrar errores estos se muestran al final de la ejecución.

Los errores léxicos aparecen en el momento en que se encuentran, cuando este se ha encontrado y el programa termina.

Los errores sintácticos o de otro tipo, (por ejemplo intentar convertir unidades de peso en unidades de divisa) se indican al finalizar la ejecución.

El programa detecta la línea en la que se produce el error lexico o sintáctico pero este valor de línea es aproximado.

## Lenguaje

Para poder utilizar la herramienta conversora hay que usar la siguiente sintaxsis:

conversion X  udOrigen -> udDestino

conversion 3 EUR -> JPY 


En el archivo de ejemplo se muestran numerosos ejemplos de ejecución que puede reconocer el analizador léxico.

Para las unidades se pueden utilizar las siguientes magnitudes:
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

Las magnitudes del sistema métrico internacional (litro, metro y gramo) pueden utilizarse con los prefijos escalares siguientes:
- mili     
- centi  
- deci   
- deca  
- hecto   
- kilo  


Para el uso de operaciones aritméticas entre unidades de medidas se utiliza la siguiente sintaxis:

 calculo X ud1 operador Y ud2

 calculo 3 miligramo + 5 onza

los operadores aceptados son:
- Suma  -> +
- Resta -> -
- Multiplicaciones -> *
- Divisiones ->/

Para simplificar el funcionamiento, el resultado se muestra en la unidad del primer elemento de la operacion.

Si falta un elemento en la operación y esta esta incompleta aparecerá error de sintaxis sin especificar y se terminará la ejecución, pues no sera capaz de procesar una regla con elemento faltante.
