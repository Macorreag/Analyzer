%{
#include<string.h>
#include<stdlib.h>
#include<stdio.h>
#include "logic.h"
int yylex();
void yyerror(char*);
char *new_temp();
void print_imc_code();
void imc_code_generator(char*,char*,char*,char*);
extern struct symtab *symbol_lookup(char*);
char *token_string=NULL;
int tuple_index=0;
int temp_index=0;
%}
%union{
 char *punctuation;
 char *operator;
 char *expr;
 char *constant;
 struct symtab *symp;
}
%token <operator> AND OR NOT ASSIGN IMPLICATION EQUIVALENT
%token <punctuation> LEFT_P RIGHT_P
%token <constant> TRUE FALSE
%token <symp> ID
%left EQUIVALENT
%left IMPLICATION
%left AND
%left OR
%right NOT
%type <expr> EXPRESSION T F Y G 
%%
/*
Especificación de YACC
símbolo:        definición
                {acción};
*/
SENTENCIALOGICA: SENTENCIA '\n' {
 printf("Tokenized String: %s\n",token_string);
 token_string=NULL;
 print_imc_code();
 tuple_index=0;
 temp_index=0;
}
| SENTENCIALOGICA SENTENCIA '\n' {
 printf("Tokenized String: %s\n",token_string);
 print_imc_code();
 token_string=NULL;
 tuple_index=0;
 temp_index=0;
}
;
SENTENCIA: ID ASSIGN EXPRESSION {
 imc_code_generator($1->name,$3,"","");
 $1->value=$3;
}
| EXPRESSION
;
EXPRESSION: EXPRESSION OR T {
 $$=new_temp();
 imc_code_generator($$,$1," V ",$3);
}
| T
;
T: T AND Y {
 $$=new_temp();
 imc_code_generator($$,$1," ^ ",$3);
}
| Y
;
Y: Y IMPLICATION F{
     $$=new_temp();
 imc_code_generator($$,$1," -> ",$3);
    }
    |
    F
;
F: F EQUIVALENT G{
    $$=new_temp();
 imc_code_generator($$,$1," <-> ",$3);
}| G

G: LEFT_P EXPRESSION RIGHT_P {
 strcpy($$,$2);
}
| NOT LEFT_P EXPRESSION RIGHT_P {
 strcpy($$," ~");
 strcat($$,$3);
}
| ID {
  $$=$1->name;
}
| TRUE {
 $$=" T ";
}
| FALSE {
 $$=" F ";
}
;
%%
char *new_temp(){
 char *temp=(char*)malloc(sizeof(char)*20);
 sprintf(temp,"t%d",++temp_index);
 return temp;
}
void print_imc_code(){
 int index=0;
 for(index=0;index<tuple_index;index++){
  printf("%s = %s %s %s\n",tuples[index].result,tuples[index].operand_left,tuples[index].operators,tuples[index].operand_right);
 }
 printf("\n===================\n"); 
}
void imc_code_generator(char *result,char *operand_left,char *operators,char *operand_right){
 tuples[tuple_index].result=result;
 tuples[tuple_index].operand_left=operand_left;
 tuples[tuple_index].operand_right=operand_right;
 tuples[tuple_index].operators=operators; 
 tuple_index++;
}
void yyerror(char *s){
 fprintf(stderr,"%s\n",s);
}
int main(void){
 yyparse();
 return 0;
}