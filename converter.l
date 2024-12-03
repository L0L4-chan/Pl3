%{
#include <stdlib.h>
#include "converter.tab.h"

void showError();
%}

%option yylineno

ope1 "(?i:conversion)"
ope2 "(?i:calculo)"
integer "-"?[0-9]+
float "-"?[0-9]+
mean  "(?i:media)" 
mode  "(?i:moda)"
median "(?i:mediana)"






%%
{ope1}                {return OPE1;}
{ope2}                {return OPE2;}
{entero}              {yylval.valInt = atoi(yytext); return ENTERO;}
{real}                {yylval.valFloat = atof(yytext); return REAL;}
//TODO OPERACIONES Y MEDIDAS           
"+"                   {return (PLUS);}
"-"                   {return (MINUS);}
"*"                   {return (MUL);}
"/"                   {return (DIV);}
"%"                   {return (MOD);}
\n                    {return (DELIM);}
"("                   {return (LPAREN);}
")"                   {return (RPAREN);}
"->"                  {return (ARROW);}
mean                  {return MEAN;}
mode                  {return MODE;}
median                {return MEDIAN;}
[ \t\r]+              { } 
%%

void showError(char* arg){ printf("LEXICAL ERROR %s %d\n  ",  arg, yylineno);}