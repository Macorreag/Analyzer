%{
    #include<stdlib.h>
    #include<string.h>
    #include "logic.h"
    #include "y.tab.h"
    extern char *token_string;
    extern void yyerror(char*);
    void tokenize(char*);
    struct symtab *symbol_lookup(char*);
%}
LETTER		[a-zA-Z]
DIGIT		[0-9]
ID			{LETTER}({LETTER}|{DIGIT})*
AND			and|AND|^|&&
OR          or|OR|v|V
NOT         not|NOT|¬|~
TRUE        true|TRUE|T
FALSE       false|FALSE|F
/*El punto para Lex significa cualquier simbolo*/
COMMENT 	[#].*[\n]   

%%
{AND}       {
                yylval.operator=strdup(yytext);
                tokenize(" AND ");
                return AND;
            }
{OR}        {
                yylval.operator=strdup(yytext);
                tokenize(" OR ");
                return OR;
            }
{NOT}       {
                yylval.operator=strdup(yytext);
                tokenize(" NOT ");
                return NOT;
            }
{TRUE}      {
                yylval.constant=strdup(yytext);
                tokenize(" TRUE ");
                return TRUE;
            }
{FALSE}     {
                yylval.constant=strdup(yytext);
                tokenize(" FALSE ");
                return FALSE;
            }
{ID}        {
                yylval.symp=symbol_lookup(yytext);
                tokenize("ID");
                return ID;
            }
"="         {
                yylval.operator=strdup(yytext);
                tokenize(" = ");
                return ASSIGN;
            }
"("         {
                yylval.punctuation=strdup(yytext);
                tokenize(" ( ");
                return LEFT_P;
            }
")"         {
                yylval.punctuation=strdup(yytext);
                tokenize(" ) ");
                return RIGHT_P;
}
"->"        {
                yylval.operator=strdup(yytext);
                tokenize(" -> ");
                return IMPLICATION;
            }
"<->"       {
                yylval.operator=strdup(yytext);
                tokenize(" <-> ");
                return EQUIVALENT;
            }

{COMMENT}   /*Linea de comentario*/;   

[ \t]       ;

\n|.        return yytext[0];

<<EOF>>     {
                exit(0);
            }

%%


void tokenize(char *token){
    if(!token_string){
        token_string=strdup(token);
    }
    else{
        strcat(token_string,token);
    }
}

struct symtab *symbol_lookup(char *symbol){
    struct symtab *sp;
    for(sp=symbol_table;sp< &symbol_table[S_SIZE];sp++){
        if(sp->name && !strcmp(sp->name,symbol))
            return sp;
        if(!sp->name){
            sp->name=strdup(symbol);
        return sp;
        }
    }
    yyerror("Cannot find symbol!");
    exit(1);
}
