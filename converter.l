%{
#include <stdlib.h>
#include "converter.tab.h"

void showError(char* arg);
%}

%option yylineno
%option noyywrap

ope1    "conversion"
ope2    "calculo"
float   -?[0-9]+(\.[0-9]+)?
arrow   "->"
euro    "EUR"
dollar  "USD"
gbp     "GBP" 
yen     "JPY"
gramo   "gramo"
stone   "piedra"
pound   "libra"
onza    "onza"
litro   "litro" 
pinta   "pinta"
gallon  "galon"
barril  "barril"
metro   "metro"
yarda   "yarda"
pie     "pie"
mile    "milla"
mili    "mili"
deci    "deci"
deca    "deca"
centi   "centi"
kilo    "kilo"
hecto   "hecto"

%%

{ope1}                   { return OPE1; }
{ope2}                   { return OPE2; }
{float}                  { yylval.valFloat = atof(yytext); return REAL; }         
"+"                      { return PLUS; }
"-"                      { return MINUS; }
"*"                      { return MUL; }
"/"                      { return DIV; }
"("                      { return LPAREN; }
")"                      { return RPAREN; }
"->"                     { return ARROW; }
{euro}                   { return EURO; }
{dollar}                 { return DOLLAR; }
{gbp}                    { return GBP; }
{yen}                    { return YEN; }
{gramo}                  { return GRAMO; }
{stone}                  { return STONE; }
{pound}                  { return POUND; }
{onza}                   { return ONZA; }
{litro}                  { return LITRO; }
{pinta}                  { return PINTA; }
{gallon}                 { return GALLON; }
{barril}                 { return BARRIL; }
{metro}                  { return METRO; }
{yarda}                  { return YARDA; }
{pie}                    { return PIE; }
{mile}                   { return MILE; }
{mili}                   { return MILI; }
{deci}                   { return DECI; }
{deca}                   { return DECA; }
{centi}                  { return CENTI; }
{kilo}                   { return KILO; }
{hecto}                  { return HECTO; }

[ \t\r\n]+               {  }
.                        {showError(yytext);}


%%

void showError(char* arg) { 
    printf("LEXICAL ERROR: %s at line %d\n", arg, yylineno);
}