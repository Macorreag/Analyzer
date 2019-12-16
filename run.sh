# El parser y el léxico deben usar el mismo conjunto de símbolos para identificar tokens; por lo tanto el léxico debe tener acceso a los símbolos definidos por el parser
# Esto se hace atravez de la opción .d al ejecutar YACC esto genera el archivo y_tab.h
yacc -d logic.y
lex logic.l
cc lex.yy.c y.tab.c -o outputFile -lfl -g
