%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

struct er {
    char* type; 
    int line;
};

struct medidas{
    char* nombre;
    float conversion;
};

struct informacion_operando{
    char* elemento[5];
    int contador;
};


struct er errores[100];
int error_count = 0;
extern int yylex();
extern int yylineno;
extern int error_flag;
void yyerror(const char *s);
void print_errors();


struct informacion_operando* dameTokens(char * s1);
bool same_ud_conv(struct informacion_operando* s1, char * s2);
bool same_ud_oper(struct informacion_operando* s1, struct informacion_operando* s2);
bool comparar_unidades(char *s1, char *s2);
struct medidas * meassureType( char* s1);
int meassureLevel(struct medidas* levels, char* lev);
float pasar_ud_base(float value,  char* op,  char* s2);
float pasar_ud_final(float value,  char* op,  char* s2);
char* prefijo (char * s1, char * s2);
char * convertir(struct informacion_operando* s1, char * s2);
struct informacion_operando* operacion_prioritaria(struct informacion_operando*s1, struct informacion_operando*s2, char *signo);
char * token_string(struct informacion_operando*s1);
void liberarTokens(struct informacion_operando* tokens);

struct medidas distancia[4] = {
    {"metro", 1},
    {"yarda", 1.09},
    {"pie", 3.28},
    {"milla", 0.00062}
};

struct medidas monedas[4] = {
    {"euro", 1},
    {"dolar", 1.05},
    {"gbp", 0.83},
    {"yen", 156.67}
};

struct medidas peso[4] = {
    {"gramo", 1},
    {"libra", 0.0022},
    {"onza", 0.035},
    {"piedra", 0.00016}
};

struct medidas capacidad[4] = {
    {"litro", 1},
    {"pinta", 2.11},
    {"galon", 0.26},
    {"barril", 0.0063}
};
%}

%token <valFloat> REAL
%token ERROR_TOKEN
%token <valString> OPE1 OPE2 PLUS MINUS MUL DIV LPAREN RPAREN ARROW 
%token <valString> GBP YEN DOLLAR EURO GRAMO STONE POUND ONZA LITRO PINTA GALLON BARRIL METRO YARDA PIE MILE 
%token <valString> MILI DECI CENTI DECA HECTO KILO 
%type <valString>  conversion unidad ud prefijo operacion 
%type <valInfo> miembro cuenta factor termino

%union {
    char * valString;
    struct informacion_operando* valInfo;
    int valInt;
    float valFloat;
};

%start s

%%

s: start
 | ERROR_TOKEN { 
        fprintf(stderr, "Parsing aborted due to a lexical error.\n"); 
        YYABORT; 
    }
;

start: 
    input
| start input
;

input:  OPE1 conversion {
    if ($2 !=NULL)
        printf("El resultado de la conversión es: %s\n",$2);
        free($2);
    }
    | OPE2 operacion {
        if ($2 !=NULL)
            printf("El resultado de la operación es: %s\n",$2);
            free($2);
    
    }
;

conversion:
    miembro ARROW unidad {
        if (same_ud_conv($1, $3)){
            $$ = convertir($1, $3);
        }else{
            $$ = NULL;
        }
    }
;

miembro:
        REAL unidad {
        char aux[100];
        snprintf(aux, sizeof(aux), "%f %s", $1, $2); 
        $$ = dameTokens(aux);
    }
;

unidad:
    ud               { $$ = $1; }
    | prefijo ud    {
        char aux[100];
        snprintf(aux, sizeof(aux), "%s%s", $1, $2);
        $$ = strdup(aux);
        }
;

ud: 
    YEN             { $$ = "dinero yen ";}
    | GBP           { $$ = "dinero gbp ";}
    | DOLLAR        { $$ = "dinero dolar"; }
    | EURO          { $$ = "dinero euro ";}
    | GRAMO         { $$ = "peso gramo ";}
    | STONE         { $$ = "peso piedra ";}
    | POUND         { $$ = "peso libra ";}
    | ONZA          { $$ = "peso onza ";}
    | LITRO         { $$ = "capacidad litro ";}
    | PINTA         { $$ = "capacidad pinta ";}
    | GALLON        { $$ = "capacidad galon ";}
    | BARRIL        { $$ = "capacidad barril ";}
    | METRO         { $$ = "distancia metro ";}
    | YARDA         { $$ = "distancia yarda ";}
    | PIE           { $$ = "distancia pie ";}
    | MILE          { $$ = "distancia milla ";}
;

prefijo:
    MILI            { $$ = "/ 1000 ";}
    |DECI           { $$ = "/ 10 ";}
    |CENTI          { $$ = "/ 100 ";}
    |DECA           { $$ = "* 10 ";}
    |HECTO          { $$ = "* 100 ";}
    |KILO           { $$ = "* 1000 ";}
;

operacion: 
     cuenta           {$$ = token_string($1);}      
;

cuenta: 
    cuenta PLUS termino{
        if (same_ud_oper($1, $3)){
            $$ = operacion_prioritaria($1, $3, "+");
            }else{$$=NULL;}
    }
    |cuenta MINUS termino{
        if (same_ud_oper($1, $3)){
            $$ = operacion_prioritaria($1, $3, "-");
            }else{$$=NULL;}
    }
    | termino                              {$$ = $1;}
;

termino: 
    termino MUL factor { 
        if (same_ud_oper($1, $3)){
            $$ = operacion_prioritaria($1, $3, "*");
            }else{$$=NULL;}
    }
    |termino DIV factor{
            if (same_ud_oper($1, $3)){
            $$ = operacion_prioritaria($1, $3, "/");
            } else{$$=NULL;}
        }
    |factor                 {$$ = $1;}
;

factor: 
    LPAREN cuenta RPAREN    {$$ = $2;}   
    |miembro                {$$ = $1;}
;


%%

int main(int argc, char *argv[]) {
    extern FILE *yyin;
    error_flag = 0;
    switch (argc) {
        case 1:
            yyin = stdin;
            yyparse();
               if (error_flag) {
                fprintf(stderr, "Se detectaron errores léxicos. Terminando el programa.\n");
                return 1; 
            }
            break;
        case 2:
            yyin = fopen(argv[1], "r");
            if (yyin == NULL) {
                printf("ERROR: No se ha podido abrir el fichero.\n");
                return 1;
            } else {
                yyparse();
                if (error_flag) { 
                    printf("Se encontraron errores durante el análisis.\n");
                    fclose(yyin);
                    return 1; 
                }
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
        for (int i = 0; i < error_count; i++) {
            if (errores[i].line == (yylineno-1)) {
            free(errores[i].type); // Liberar memoria previa
            errores[i].type = strdup(s);
            aux = i;
            return; 
            }
        }
        errores[aux].type = strdup(s);
        errores[aux].line = (yylineno-1);
        if (aux == error_count)error_count++;
    }
}

void print_errors() {

    printf("Errores de sintaxis encontrados:\n");
    for (int i = 0; i < error_count; i++) {
        printf("Error: %s en la línea %d\n", errores[i].type, errores[i].line);
        free(errores[i].type);
        errores[i].type = NULL; 
    }

    error_count = 0;
}

struct informacion_operando* dameTokens(char * s1) {
    if (s1 == NULL) {
        return NULL;
    }
    struct informacion_operando* resultado = (struct informacion_operando*)malloc(sizeof(struct informacion_operando));
    if (resultado == NULL) {
        return NULL;
    }

    resultado->contador = 0;
    for (int i = 0; i < 5; i++) {
        resultado->elemento[i] = NULL;
    }
    char * s1copy = strdup(s1);
    if (s1copy == NULL) {
        free(resultado);
        return NULL;
    }
    char * buffer = strtok(s1copy, " ");
    while (buffer != NULL && resultado->contador < 5) {
        resultado->elemento[resultado->contador] = strdup(buffer);
        resultado->contador++;
        buffer = strtok(NULL, " ");
    }
    free(s1copy);
    return resultado;
}

bool same_ud_conv(struct informacion_operando* s1, char * s2) {
    if(s1 == NULL || s2 == NULL ) {
        yyerror("Falta elemento");
        return false;
    }
    struct informacion_operando* unidad = dameTokens(s2);
    char * compare1;
    char * compare2;

    if (s1->contador == 3 && unidad->contador == 2) {
        compare1 = s1->elemento[1]; 
        compare2 = unidad->elemento[0];  
    } else if (s1->contador == 5 && unidad->contador == 4) {
        compare1 = s1->elemento[3]; 
        compare2 = unidad->elemento[2]; 
    } else if (s1->contador == 3 && unidad->contador == 4) {
        compare1 = s1->elemento[1]; 
        compare2 = unidad->elemento[2]; 
    } else if (s1->contador == 5 && unidad->contador == 2) {
        compare1 = s1->elemento[3]; 
        compare2 = unidad->elemento[0]; 
    } else {
        yyerror("Error: Formato no válido para las cadenas.\n");
        return false;
    }    
    return comparar_unidades(compare1, compare2);
}

void liberarTokens(struct informacion_operando*tokens) {
    for (int i = 0; i < tokens->contador; i++) {
        free(tokens->elemento[i]);
    }
    tokens->contador = 0;
    free(tokens);
}

bool comparar_unidades(char *compare1, char * compare2) {

      if (strcmp(compare1, compare2) != 0) {
        char error_msg[100];
        snprintf(error_msg, sizeof(error_msg), "Las unidades '%s' y '%s' no son del mismo tipo", compare1, compare2);
        yyerror(error_msg);
        return false;
    }
    return true;
}

bool same_ud_oper(struct informacion_operando* s1, struct informacion_operando* s2) {
    
     if (s1 == NULL) {
        yyerror("Faltan argumentos");
        return false;
    }
    if (s2 == NULL) {
        yyerror("Faltan argumentos");
        return false;
    }

    char * compare1;
    char * compare2;

    if (s1->contador == 3 && s2->contador == 3) {
        compare1 = s1->elemento[1]; 
        compare2 = s2->elemento[1];  
    } else if (s1->contador == 5 && s2->contador == 5) {
        compare1 = s1->elemento[3]; 
        compare2 = s2->elemento[3]; 
    } else if (s1->contador == 3 && s2->contador == 5) {
        compare1 = s1->elemento[1]; 
        compare2 = s2->elemento[3]; 
    } else if (s1->contador == 5 && s2->contador == 3) {
        compare1 = s1->elemento[3]; 
        compare2 = s2->elemento[1]; 
    } else {
        yyerror("Error: Formato no válido para las cadenas.");
        return false;
    }

    return comparar_unidades(compare1, compare2);
}

struct medidas* meassureType( char* s1) {
    if (s1 == NULL) {
        yyerror("No existe tipo de medida");
        return NULL;
    }

    if (strcmp(s1, "dinero") == 0) {
        return monedas;
    } else if (strcmp(s1, "peso") == 0) {
        return peso;
    } else if (strcmp(s1, "capacidad") == 0) {
        return capacidad;
    } else if (strcmp(s1, "distancia") == 0) {
        return distancia;
    }

    char error_msg[100];
    snprintf(error_msg, sizeof(error_msg), "Tipo de medida no reconocido.");
    yyerror(error_msg);

    return NULL;
}

int meassureLevel(struct medidas * levels, char* lev){

    for(int i=0; i<4; i++){
        if(strcmp(levels[i].nombre, lev) == 0){
            return i;
            break;
        }
    }
 }


float pasar_ud_base(float value,  char* op,  char* s2) {
    float resultado;
    if (strcmp(op, "/") == 0) {
        resultado = value / atof(s2);
    } else if (strcmp(op, "*") == 0) {
        resultado = value * atof(s2);
    }
    return resultado;
}

float pasar_ud_final(float value,  char* op,  char* s2) {
    float resultado;
    if (strcmp(op, "/") == 0) {
        resultado = value * atof(s2);
    } else if (strcmp(op, "*") == 0) {
        resultado = value / atof(s2);
    }
    return resultado;
}

char* prefijo (char * s1, char * s2){
    char concatenated[100]; 
    snprintf(concatenated, sizeof(concatenated), "%s%s", s1, s2);

        if (strcmp(concatenated, "/1000") == 0){
            return "mili";
        }else if (strcmp(concatenated, "/100") == 0){
            return "centi";
        }else if (strcmp(concatenated, "/10") == 0){
            return "deci";    
        }else if (strcmp(concatenated, "*1000") == 0){
            return "kilo";
        }else if (strcmp(concatenated, "*100") == 0){
            return "hecto";
        }else if (strcmp(concatenated, "*10") == 0){
            return "deca"; 
        }
    return NULL;
}

char * convertir(struct informacion_operando* s1, char * s2){
   
    struct informacion_operando* unidad = dameTokens(s2);
    int position1;
    int position2;

    float quantity;
    char * resultado;
    struct medidas * medida; 


    switch(s1->contador) {
        case 3:
            medida = meassureType(s1->elemento[1]); 
            position1 = meassureLevel(medida, s1->elemento[2]);  
            quantity = atof(s1->elemento[0]); 

            if(position1!=0){
                quantity = quantity / medida[position1].conversion;
            }
            break;

        case 5:
            medida = meassureType(s1->elemento[3]);  
            position1 = meassureLevel(medida, s1->elemento[4]); 
            quantity = atof(s1->elemento[0]);
             

            if(position1!=0 || (strcmp(s1->elemento[3], "dinero")==0)){
                yyerror("no puede tener prefijo");
                return NULL;
            }else{
                
                quantity = pasar_ud_base(quantity, s1->elemento[1], s1->elemento[2]);
                
            }
            break;
    }

    switch(unidad->contador){
        case 2:
            position2 = meassureLevel(medida, unidad->elemento[1]);
            if(position2!=0){
                quantity = quantity * medida[position2].conversion;
                
            }
            snprintf(resultado, 100, "%.4f %s", quantity, unidad->elemento[1]);
            break;
        case 4:
            position2 = meassureLevel(medida, unidad->elemento[3]);
            if(position2!=0){
                yyerror("no puede tener prefijo");
                return NULL;
            }else{   
                quantity = pasar_ud_final(quantity, unidad->elemento[0], unidad->elemento[1]);  
                snprintf(resultado, 100, "%.4f %s%s", quantity, prefijo(unidad->elemento[0], unidad->elemento[1]), unidad->elemento[3]);
          } 
            break;    
    }
    return resultado;
}

struct informacion_operando* operacion_prioritaria(struct informacion_operando* s1, struct informacion_operando* s2, char * signo) {

    struct informacion_operando* miembro = malloc(sizeof(struct informacion_operando));
    if (miembro == NULL) {
        liberarTokens(s1);
        liberarTokens(s2);
        liberarTokens(miembro);;
        return NULL;
    }
    miembro->elemento[0] = malloc(50 * sizeof(char));  
    if (miembro->elemento[0] == NULL) {
        liberarTokens(miembro);;
        return NULL;
    }

    int position1;
    int position2;
    float quantity1 = atof(s1->elemento[0]);
    float quantity2 = atof(s2->elemento[0]);
    float resultado;
    struct medidas *medida;

    if (same_ud_oper(s1, s2)) {

        switch (s1->contador) {
            case 3:
                medida = meassureType(s1->elemento[1]);
                position1 = meassureLevel(medida, s1->elemento[2]);
                if (position1 != 0) { 
                    quantity1 = quantity1 / medida[position1].conversion;
                }

                miembro->elemento[1] = s1->elemento[1];
                miembro->elemento[2] = s1->elemento[2];
                miembro->contador = 3;
                break;

            case 5:
                medida = meassureType(s1->elemento[3]);
                position1 = meassureLevel(medida, s1->elemento[4]);

                if (position1 != 0 || (strcmp(s1->elemento[3], "dinero") == 0)) {
                    yyerror("no puede tener prefijo");
                    return NULL;
                } else {
                    
                    quantity1 = pasar_ud_base(quantity1, s1->elemento[1], s1->elemento[2]);
                }
                miembro->elemento[1] = s1->elemento[1];
                miembro->elemento[2] = s1->elemento[2];
                miembro->elemento[3] = s1->elemento[3];
                miembro->elemento[4] = s1->elemento[4];
                miembro->contador = 5;
                break;
        }

        switch (s2->contador) {
            case 3:
                position2 = meassureLevel(medida, s2->elemento[2]);
                if (position2 != 0) {
                    
                    quantity2 = quantity2 / medida[position2].conversion;
                }
                break;
            case 5:
                position2 = meassureLevel(medida, s2->elemento[4]);
                if (position2 != 0 || (strcmp(s2->elemento[3], "dinero") == 0)) {
                    yyerror("no puede tener prefijo");
                    return NULL;
                } else {
                    quantity2 = pasar_ud_base(quantity2, s2->elemento[1], s2->elemento[2]);
                }
                break;
        }

        if (strcmp(signo, "+") == 0) {
            resultado = quantity1 + quantity2;
        }else if (strcmp(signo, "-") == 0) {
            resultado = quantity1 - quantity2;
        }else if (strcmp(signo, "*") == 0){
             resultado = quantity1 * quantity2;
        }else if (strcmp(signo, "/") == 0) {
            resultado = quantity1 / quantity2;
        }else {
            return NULL;
        }

        if(s1->contador== 3 ) {
            if (position1 != 0) {
                resultado = resultado * medida[position1].conversion;
            }
        } else {
            resultado = pasar_ud_final(resultado, s1->elemento[1], s1->elemento[2]);
        }
        snprintf(miembro->elemento[0], 50, "%.4f", resultado);
        return miembro;
    } else {
        yyerror("Las unidades de medida deben ser iguales.");
        return NULL;
    }
}

char* token_string(struct informacion_operando*s1) {
    if(s1==NULL) {
        return NULL;
    }
    
    char *resultado = malloc(200 * sizeof(char));
   if (s1->contador == 3) {
        snprintf(resultado, 200, "%s %s", s1->elemento[0], s1->elemento[2]);
    } else if (s1->contador == 5) {
        char* prefix = prefijo(s1->elemento[1], s1->elemento[2]);
        if (prefix == NULL) {  
            return NULL; 
        }
        snprintf(resultado, 200, "%s %s%s", s1->elemento[0], prefix, s1->elemento[4]);
    }
    return resultado;  
}
