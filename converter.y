%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct er {
    char* type; 
    int line;
};

struct medidas{
    char* nombre;
    float conversion
}



struct medidas distancia[4];
distancia[0].nombre = "metro";
distancia[0].conversion = 1;
distancia[1].nombre = "yarda";
distancia[1].conversion = 1.09
distancia[2].nombre = "pie";
distancia[2].conversion = 3.28;
distancia[3].nombre = "mile";
distancia[3].conversion = 0.00062;

struct medidas monedas[4];
monedas[0].nombre = "euro";
monedas[0].conversion = 1;
monedas[1].nombre = "dolar";
monedas[1].conversion = 1.05;
monedas[2].nombre = "gbp";
monedas[2].conversion = 0.83;
monedas[3].nombre = "yen";
monedas[3].conversion = 156.67;


struct medidas peso[4];
peso[0].nombre = "gramo";
peso[0].conversion = 1;
peso[1].nombre = "pound";
peso[1].conversion = 0.0022;
peso[2].nombre = "onza";
peso[2].conversion = 0.035;
peso[3].nombre = "stone";
peso[3].conversion = 0.00016;

struct medidas capacidad[4];
capacidad[0].nombre = "litro"
capacidad[0].conversion = 1;
capacidad[1].nombre = "pinta"
capacidad[1].conversion = 2.11;
capacidad[2].nombre = "gallon";
capacidad[2].conversion = 0.26;
capacidad[3].nombre = "barril";
capacidad[3].conversion = 0.0063;


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
%token GBP YEN DOLLAR EURO GRAMO STONE POUND ONZA LITRO PINTA GALLON BARRIL METRO YARDA PIE MILE 
%token MILI DECI CENTI DECA HECTO KILO 
%token <valString>  
%token <valFloat> 
%token <valInt>  



%start S
%%

S:  OPE1 conversion {printf( "%d",$2)}
    | OPE2 operacion {printf( "%d",$2)}
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

operacion: 
 MEAN  lista  
 | MEDIAN lista
 | MODE lista
 | cuenta
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
    | BARRIL        { $$ = "capacidad barril "}
    | METRO         { $$ = "distancia m "}
    | YARDA         { $$ = "distancia yarda "}
    | PIE           { $$ = "distancia pie "}
    | MILE          { $$ = "distancia milla "}


prefijo:
    MILO            { $$ = "/ 1000 "}
    |DECI           { $$ = "/ 10 "}
    |CENTI          { $$ = "/ 100 "}
    |DECA           { $$ = "* 10 "}
    |HECTO          { $$ = "* 100 "}
    |KILO           { $$ = "* 1000 "}


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

  
