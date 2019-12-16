# Analyzer

Analizer es un analizador sintáctico-semántico para un lenguaje formal de lógica proposicional con proposiciones y oraciones de tipo aritmético y algebraico.Este analizador es creado apartir de la union de un analizador Lexico creado con _lex_ y un analizador sintáctico ascendente por desplazamiento y reducción creado con _yacc_.

**Objetivo general de analyzer:** Análisis, diseño e implementación de un analizador sintáctico-semántico para un lenguaje de lógica proposicional con proposiciones y oraciones de tipo aritmético y algebraico.

## Marco Teórico

Hemos visto cómo el análisis léxico facilita la tarea de reconocer los elementos de un lenguaje uno a uno (Ver repositorio [AnalizadorLexico](https://github.com/Macorreag/AnalizadorLexico) ).A partir de ahora, vamos a centrarnos en el análisis sintáctico-semántico,que nos permitirá averiguar si un fichero de entrada cualquiera respeta las reglas de una gramática concreta en este caso la gramatica de lógica proposicional. Para el dtema del análisis sintáctico vamos a utilizar la herramienta yacc (Yet Another Compiler Compiler).

Una lógica proposicional, o a veces lógica de orden cero, es un sistema formal cuyos elementos más simples representan proposiciones, y cuyas constantes lógicas, llamadas conectivas lógicas, representan operaciones sobre proposiciones, capaces de formar otras proposiciones de mayor complejidad.

Actualmente se tienen dos sistemas formales de lógica proposicional.El primero es un sistema axiomático simple, y el segundo es un sistema sin axiomas, de deducción natural.Este  compilador interpretara un sistema axiomático simple y sera creado mediante programas como _yacc_ y _lex_, los cuales son herramientas de gran utilidad para un diseñador de compiladores.

Si bien es cierto que existen compiladores que pueden reconocer este tipo de lenguajes como Prolog, Analyzer es un ejercicio para determinar el comportamiento de un compilador al realizar su análisis sintáctico-semántico.



## Diagramas de Sintaxis

Los diagramas de funcionamiento de Analizer están creados con la especificación BNF mediante la herramienta [Railroad Diagram Generator](https://www.bottlecaps.de/rr/ui) 
![Logo Railroad Diagram Generator](Diagrams/diagram/rr-1.60.png "Logo Railroad Diagram Generator")
y por lo tanto se añade un archivo de extención _.ebnf_ con el cual generar dichos diagramas.


**LOGIC SENTENCE**: Esta es la expresión mas general que puede ser reconocida por este compilador.

![Logo Railroad Diagram Generator](Diagrams/diagram/LOGICSENTENCE.png "Logo Railroad Diagram Generator")

**SENTENCE**: Los ID pueden ser seteados mediante el token ASSIGN que corresponde a el simbolo '=' y su contenido corresponde a una expresión .

![Logo Railroad Diagram Generator](Diagrams/diagram/SENTENCE.png "Logo Railroad Diagram Generator")

# Tabla de Simbolos

El parser y el léxico deben usar el mismo conjunto de símbolos para identificar tokens; por lo tanto el léxico debe tener acceso a los símbolos definidos por el parser. Una forma de hacer esto es decir a Yacc, mediante la opción `–d` para que genere el archivo archivo _y_tab.h_ el cual contiene esta tabla .Esta opción se incluye en el archivo _run.sh_ .

# Alfabeto Reconocido

Este analizador lexico esta compuesto de las siguientes  categorias lexicas las cuales constituyen un simbolo elemental  de un lenguaje de programación:

|Categoría | Expresión Regular |
| ---------- | ---------- |
| Proposiciones  | `[a-zA-Z0-9]+`   |
| Predicado Lógicos   | ` [pqrt][0-9]{0,5} `|
| Predicado Algebraico | ` [xyz][0-9]{0,5} `|
| Operador | ` ["+"\|"-"\|"*"\|"/"] \|\| ["&&"\|"\|\|"->"] \|\| [":"\|":="\|"<>"\|"<"\|">"]  ` |
| Delimitador |`  ["("\|")"] `|
| Comentario |` ["#"][ \t\na-zA-Z0-9]*[\n] ` |
| Fin de Sentencia | ` [;] `|
| Desconocido |` . ` |


# Ejemplo 
Una Formula Bien Formada 
> `sudo apt-get install bison flex`






## Basado en GIC 
[ Lógica Proposicional ](https://es.wikipedia.org/wiki/Lógica_proposicional)

## Creador

[**Macorreag**](https://github.com/macorreag)  Miller Alexander Correa Gonzalez



## Categorias Léxicas
Este analizador lexico esta compuesto de las siguientes  categorias lexicas las cuales constituyen un simbolo elemental  de un lenguaje de programación:

* Espacio
* Numero
* Predicado Aritmetico
* Predicado Algebraico
* Operador
* Delimitador
* Comentario
* Fin de Sentencia
* Desconocido


## Expresiones Regulares

A continuación se especifican las expresiones regulares que determinan el patrón que caracteriza a cada una de esas categorías léxicas.

|Categoría | Expresión Regular |
| ---------- | ---------- |
| Espacio  | ` [ \t\n]+`   |
| Predicado Aritmetico   | ` [pqrt][0-9]{0,5} `|
| Predicado Algebraico | ` [xyz][0-9]{0,5} `|
| Operador | ` ["+"\|"-"\|"*"\|"/"] \|\| ["&&"\|"\|\|"->"] \|\| [":"\|":="\|"<>"\|"<"\|">"]  ` |
| Delimitador |`  [ "("\|")"\|"["\|"\]"\|"{"\|"}"]  `|
| Comentario |` ["#"][ \t\na-zA-Z0-9]*[\n] ` |
| Fin de Sentencia | ` [;] `|
| Desconocido |` . ` |


## Uso en LinuX

### Instalar Lex y Yacc en Ubuntu

> `sudo apt-get install bison flex`

Para compilar los archivos Lex del  Analizador Lexico _main.l_  en las estaciones de trabajo Linux Lex ejecute las siguientes instrucciones desde la línea de comandos :

> `sh run.sh`

Internamente ejecutan las siguientes instrucciones:

> `flex main.l`

Este comando usa las expresiones regulares y el código c en el archivo lex (main.l) para crear un archivo en  **C** que contenga el código para el escáner. Este archivo c siempre se llama lex.yy.c.

> `cc lex.yy.c -lfl -o  executable`

Este comando compila el archivo **C** en un ejecutable con el nombre de _executable_.

> `./outputFile < test/code > results/code.out`



### Uso externo YACC
> `flex ejemplo.l`
> `bison -d ejemplo.y`
> `g++ -o ejemplo ejemplo.tab.c lex.yy.c `


Use este comado para ejecutar el escáner, simplemente escriba el nombre del ejecutable en la línea de comandos y especifique un archivo de entrada utilizando el operador de redireccionamiento. En el  ejemplo se direcciona al analizador el archivo _code1_ que se encuentra en la carpeta _test_  y el resultado se redirecciona al archivo _code1.out_ que se encuentra en la carpeta _out_.ut_.eta _out_.ut_.

### guia para la creacion del compilador 

http://www.exa.unicen.edu.ar/catedras/compila1/index_archivos/Herramientas/Yacc.pdf

https://www.dlsi.ua.es/asignaturas/pl/downloads/1415/HTyacc-lex.pdf

lex http://es.tldp.org/Manuales-LuCAS/FLEX/flex-es-2.5.html

## Funcionamiento de Analizer en Ubuntu


El analizador usa la especificación BNF para las reglas de derivación debido a que esta construido mediante YACC y este usa tal especificación para definir la GIC

### Salida de analizer
 Tokenized String:

### Lenguaje Reconocido
<aside class="warning">
El documento del lenguaje reconocido debe terminar con un '\n' ó Enter para que la entrada sea reconocida completamente
</aside>

# yyval

Comunicación LEX y YACC lex puede también pasar el valor del token usando la variable externa yylval.