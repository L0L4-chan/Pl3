%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct er {
    char* type; 
    int line;
};

struct er errores[100];
int error_count = 0;

extern int yylex();
extern int yylineno;

void yyerror(const char *s);
void print_errors();
void same_tag(char * s1, char * s2);
%}

%union {
    char * valString;
    int valInt;
    float valFloat;
}

%token OPE1 OPE1 ENTERO REAL PLUS MINUS MIL DIV MOD DELIM LPAREN RPAREN ARROW MEAN MODE MEDIAN GBP 
%token YEN DOLLAR EURO GRAMO STONE POUND ONZA LITRO PINTA GALLON METRO YARDE PIE MILE DAY HOURS MINUTE SECOND 
%token MILO DECI CENTI DECA HECTO KILO 
%token <valString>  
%token <valFloat> 
%token <valInt>  



%start S
%%

S:  




;



%%
int main(int argc, char *argv[]) {
    extern FILE *yyin;

    switch (argc) {
        case 1:
            yyin = stdin;
            yyparse();
            if (error_count != 0) print_errors();
            break;
        case 2:
            yyin = fopen(argv[1], "r");
            if (yyin == NULL) {
                printf("ERROR: No se ha podido abrir el fichero.\n");
            } else {
                yyparse();
                if (error_count != 0) print_errors();
                fclose(yyin);
            }
            break;
        default:
            printf("ERROR: Demasiados argumentos.\nSintaxis: %s [fichero_entrada]\n\n", argv[0]);
    }
}

void yyerror(const char *s) {
    int aux = error_count;
    if (error_count < 100) { 
        char error_msg[200];
        snprintf(error_msg, sizeof(error_msg), "%s ", s);
        
        for (int i = 0; i < error_count; i++) {
            if (errores[i].line == yylineno) {

                aux = i;
            }
        }
        errores[aux].type = strdup(error_msg);
        errores[aux].line = yylineno;
        if ( aux == error_count)error_count++;
    }
}

void print_errors() {
    printf("Errores de sintaxis encontrados:\n");
    for (int i = 0; i < error_count; i++) {
        printf("Error: %s en la línea %d\n", errores[i].type, errores[i].line);
    }

    error_count = 0;
}

void same_tag (char *s1,  char *s2) {
    if (strcmp(s1, s2) != 0){
        char error_msg[100];
        snprintf(error_msg, sizeof(error_msg), "Las unidades '%s' y '%s' no son del mismo tipo", s1, s2);
        yyerror(error_msg);
    }
}    
