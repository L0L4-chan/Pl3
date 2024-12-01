%{
#include <stdlib.h>
#include "converter.tab.h"

void showError();
%}

%option yylineno





%%





%%

void showError(char* arg){ printf("LEXICAL ERROR %s %d\n  ",  arg, yylineno);}