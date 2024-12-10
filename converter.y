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

%token OPE1 OPE2 ENTERO REAL PLUS MINUS MUL DIV MOD DELIM LPAREN RPAREN ARROW MEAN MODE MEDIAN 
%token GBP YEN DOLLAR EURO GRAMO STONE POUND ONZA LITRO PINTA GALLON METRO YARDA PIE MILE DAY HOURS MINUTE SECOND 
%token MILI DECI CENTI DECA HECTO KILO 
%token <valString>  
%token <valFloat> 
%token <valInt>  



%start S
%%

S:  OPE1 conversion
    | OPE2 operacion 
    ;

conversion:
    ENTERO unidad ARROW unidad {
            if(same_tag($2, $4)) {
                converter($1,$2,$4); // TODO FUNCION conversion

                printf("Realizando conversión de %d %s a  %s\n", $1, $2, $4);
            }


        
        //TODO FUNCIONES ver si ambas unidades son compatibles
    }
    | REAL unidad ARROW unidad {
         if(same_tag($2, $4)) {
             converter($1,$2,$4); // TODO FUNCIONES conversion
                printf("Realizando conversión de %.2f %s a %s\n", $1, $2, $4);
   
         }

    }
    ;

unidad:
    ud  {$$1}
    | prefijo ud {strcat($$1, $$2)}


ud: 
    YEN             { $$ = "dinero yen "}
    | GBP           { $$ = "dinero gbp "}
    | DOLLAR        { $$ = "dinero dollar" }
    | EURO          { $$ = "dinero euro "}
    | GRAMO         { $$ = "peso gr "}
    | STONE         { $$ = "peso stone "}
    | POUND         { $$ = "peso libra "}
    | ONZA          { $$ = "peso onza "}
    | LITRO         { $$ = "capacidad l "}
    | PINTA         { $$ = "capacidad pinta "}
    | GALLON        { $$ = "capacidad galon "}
    | METRO         { $$ = "distancia m "}
    | YARDA         { $$ = "distancia yarda "}
    | PIE           { $$ = "distancia pie "}
    | MILE          { $$ = "distancia milla "}
    | DAY           { $$ = "tiempo dia "}
    | HOURS         { $$ = "tiempo hora "}
    | MINUTE        { $$ = "tiempo minutos "}
    | SECOND        { $$ = "tiempo segundos "}

prefijo:
    MILO            { $$ = "/ 1000 "}
    |DECI           { $$ = "/ 10 "}
    |CENTI          { $$ = "/ 100 "}
    |DECA           { $$ = "* 10 "}
    |HECTO          { $$ = "* 100 "}
    |KILO           { $$ = "* 1000 "}


operacion: 
 MEAN  lista
 | MEDIAN lista
 | MODE lista
 | cuenta
 ;


lista:
   entero unidad
 | lista entero unidad 
 | float unidad
 | lista float unidad
 ;

cuenta: 
entero unidad signo entero unidad {

    if(same_tag($2, $5)) { // pendiente de hacer una variacion para operaciones 
        converterOperacion($1, $2, $3, $4,$5); // TODO FUNCION operacion
    }
}
| cuenta signo entero unidad
| cuenta signo float unidad
| float unidad signo float unidad
| LPAREN cuenta RPAREN


signo:
    PLUS           { $$ = "+"; }
    | MINUS          { $$ = "-"; }
    | MUL           { $$ = "*"; }
    | DIV           { $$ = "/"; }
    | MOD           { $$ = "%"; }
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


void same_tag(char *s1, char *s2) {
    char *tokens1[4];  
    char *tokens2[4];
    char *compare1; 
    char *compare2;

    int count1 = 0;
    int count2 = 0;

    char *token = strtok(s1, " ");
    while (token != NULL && count1 < 4) {
        tokens1[count1++] = token;
        token = strtok(NULL, " ");
    }

    token = strtok(s2, " ");
    while (token != NULL && count2 < 4) {
        tokens2[count2++] = token;
        token = strtok(NULL, " ");
    }

  

    if (count1 == 2 && count2 == 2) {
        compare1 = tokens1[0]; 
        compare2 = tokens2[0];  
    } else if (count1 == 4 && count2 == 4) {
        compare1 = tokens1[2];  
        compare2 = tokens2[2];  
    } else if (count1 == 2 && count2 == 4) {
        compare1 = tokens1[0];  
        compare2 = tokens2[2]; 
    } else if (count1 == 4 && count2 == 2) {
        compare1 = tokens1[2];  
        compare2 = tokens2[0]; 
    } else {
        yyerror("Error: Formato no válido para las cadenas.\n");
        return;
    }

    
    if (strcmp(compare1, compare2) != 0) {
        char error_msg[100];
        snprintf(error_msg, sizeof(error_msg), "Las unidades '%s' y '%s' no son del mismo tipo", compare1, compare2);
        yyerror(error_msg);
        return;
    }
}

string converter(int x, char* s1, char* s2){

}

  
