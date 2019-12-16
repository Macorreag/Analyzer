# Analyzer

Analizer es un lenguaje de programación para un lenguaje formal de lógica proposicional con proposiciones y oraciones de tipo aritmético y algebraico.Este ejercicio contiene un analizador sintáctico ascendente por desplazamiento y reducción(Según Especificación de YACC).

**Objetivo general:**
Análisis, diseño e implementación de un analizador sintáctico-semántico
para un lenguaje de lógica proposicional con proposiciones y oraciones de tipo aritmético y algebraico.



## Funcionamiento de Analizer

El analizador usa la especificación BNF para las reglas de derivación debido a que esta construido mediante YACC y este usa tal especificación para definir la GIC

# Lenguaje Reconocido
<aside class="warning">
El documento del lenguaje reconocido debe terminar con un '\n' ó Enter para que la entrada sea reconocida completamente
</aside>


# Diagramas de Sintaxis

Los diagramas de funcionamiento de Analizer están creados mediante la especificación BNF mediante la herramienta [Railroad Diagram Generator](https://www.bottlecaps.de/rr/ui)  y por lo tanto se añade un archivo de extención _.ebnf_ con el cual generar tales diagramas.



# yyval

Comunicación LEX y YACC lex puede también pasar el valor del token usando la variable externa yylval.

# Tabla de Simbolos

El parser y el léxico deben usar el mismo conjunto de símbolos para identificar tokens; por lo tanto el léxico debe tener acceso a los símbolos definidos por el parser. Una forma de hacer esto es decir a Yacc, mediante la opción –d que se incluye en el archivo run.sh 

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


## Marco teórico

Hemos visto cómo el análisis léxico facilita la tarea de reconocer los elementos
de un lenguaje uno a uno (Ver repositorio AnalizadorLexico). A partir de ahora, vamos a centrarnos en el análisis sintáctico,que nos permitirá averiguar si un fichero de entrada cualquiera respeta las reglas de una gramática concreta. Para el tema del análisis sintáctico vamos a utilizar la herramienta yacc (Yet Another Compiler Compiler).

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
