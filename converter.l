%{
#include <stdlib.h>
#include "converter.tab.h"

void showError();
%}

%option yylineno

ope1    "(?i:conversion)"
ope2    "(?i:calculo)"
integer "-"?[0-9]+
float   "-"?[0-9]+
mean    "(?i:media)" 
mode    "(?i:moda)"
median  "(?i:mediana)"
euro    "EUR"
dollar  "USD"
gbp   "GBP" 
yen     "JPY"
gramo   "(?i:gramo)"
stone   "(?i:piedra)"
pound   "(?i;libra)"
onza    "(?i:onza)"
litro   "(?i:litro)" 
pinta   "(?i:pinta)"
gallon  "(?i:galon)"
metro   "(?i:metro)"
yarda   "(?i:yarda)"
pie     "(?i:pie)"
mile    "(?i:milla)"
day     "(?i:dia)"
hours   "(?i:hora)"
minute  "(?i:minuto)"
second  "(?i:segundo)"
mili    "(?i:mili)"
deci    "(?i:deci)"
deca    "(?i:deca)"
centi   "(?i:centi)"
kilo    "(?i:kilo)"


{ope1}                {return OPE1;}
{ope2}                {return OPE2;}
{entero}              {yylval.valInt = atoi(yytext); return ENTERO;}
{real}                {yylval.valFloat = atof(yytext); return REAL;}         
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
euro                  {return EURO;}
dollar                {return DOLLAR;}
gbp                   {return GBP;}
yen                   {return YEN;}
gramo                 {return GRAMO;}
stone                 {return STONE;}
pound                 {return POUND;}
onza                  {return ONZA;}
litro                 {return LITRO;}
pinta                 {return PINTA;}
gallon                {return GALLON;}
metro                 {return METRO;}
yarda                 {return YARDA;}
pie                   {return PIE;}
mile                  {return MILE;}
day                   {return DAY;}
hours                 {return HOURS;}
minute                {return MINUTE;}
second                {return SECOND;}
mili                  {return MILI;}
deci                  {return DECI;}
deca                  {return DECA;}
centi                 {return CENTI;}
kilo                  {return KILO;}


[ \t\r]+              { } 
%%

void showError(char* arg){ printf("LEXICAL ERROR %s %d\n  ",  arg, yylineno);}