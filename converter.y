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

struct tokens {
    char* token[5];
    int contador;
};


struct er errores[100];
int error_count = 0;
extern int yylex();
extern int yylineno;
void yyerror(const char *s);
void print_errors();


struct tokens * dameTokens(char * s1);
bool same_ud_conv(struct tokens * s1, char * s2);
bool same_ud_oper(struct tokens * s1, struct tokens * s2);
struct medidas * meassureType(const char* s1);
int meassureLevel(struct medidas* levels, char* lev);
float pasar_ud_base(float value, const char* op, const char* s2);
float pasar_ud_final(float value, const char* op, const char* s2);
char* prefijo (char * s1, char * s2);
char * convertir(struct tokens * s1, char * s2);
struct tokens * operacion_prioritaria(struct tokens *s1, struct tokens *s2, char *signo);
char * token_string(struct tokens *s1);
void liberarTokens(struct tokens *tokens);

struct medidas distancia[4] = {
    {"metro", 1},
    {"yarda", 1.09},
    {"pie", 3.28},
    {"mile", 0.00062}
};

struct medidas monedas[4] = {
    {"euro", 1},
    {"dolar", 1.05},
    {"gbp", 0.83},
    {"yen", 156.67}
};

struct medidas peso[4] = {
    {"gramo", 1},
    {"pound", 0.0022},
    {"onza", 0.035},
    {"stone", 0.00016}
};

struct medidas capacidad[4] = {
    {"litro", 1},
    {"pinta", 2.11},
    {"gallon", 0.26},
    {"barril", 0.0063}
};
%}

%token <valFloat> REAL
%token <valString> OPE1 OPE2 PLUS MINUS MUL DIV DELIM LPAREN RPAREN ARROW MEAN MODE MEDIAN 
%token <valString> GBP YEN DOLLAR EURO GRAMO STONE POUND ONZA LITRO PINTA GALLON BARRIL METRO YARDA PIE MILE 
%token <valString> MILI DECI CENTI DECA HECTO KILO 
%type <valString>  conversion unidad ud prefijo operacion 
%type <valToken> miembro cuenta factor termino

%union {
    char * valString;
    struct tokens * valToken;
    int valInt;
    float valFloat;
};

%start S

%%

S:  OPE1 conversion {
    if ($2 !=NULL)
        printf("El resultado de la conversión es: %s",$2);
    }
    | OPE2 operacion {
        if ($2 ==NULL)
            printf("El resultado de la operación es: %s",$2);
    }
;


conversion:
    miembro ARROW unidad {
        if (same_ud_conv($1, $3)){$$ = convertir($1, $3);}
    }
;

miembro:
         REAL unidad {
        char aux[100];
        snprintf(aux, sizeof(aux), "%f %s", $1, $2); 
        $$ = dameTokens(aux);
    };

unidad:
    ud               { $$ = $1; }
    | prefijo ud    {char aux[100];
                    snprintf(aux, sizeof(aux), "%s%s", $1, $2);
                    $$ = strdup(aux);}
;


ud: 
    YEN             { $$ = "dinero yen ";}
    | GBP           { $$ = "dinero gbp ";}
    | DOLLAR        { $$ = "dinero dolar"; }
    | EURO          { $$ = "dinero euro ";}
    | GRAMO         { $$ = "peso gramo ";}
    | STONE         { $$ = "peso stone ";}
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


prefijo:
    MILI            { $$ = "/ 1000 ";}
    |DECI           { $$ = "/ 10 ";}
    |CENTI          { $$ = "/ 100 ";}
    |DECA           { $$ = "* 10 ";}
    |HECTO          { $$ = "* 100 ";}
    |KILO           { $$ = "* 1000 ";}


operacion: 
     cuenta           {$$ = token_string($1);}      
;

cuenta: 
    cuenta PLUS termino{
        $$ = operacion_prioritaria($1,$3, "+");
    }
    |cuenta MINUS termino{
        $$ = operacion_prioritaria($1, $3, "-");
    }
    | termino                              {$1;}
;

termino: 
    termino MUL factor {
        $$ = operacion_prioritaria($1, $3, "*");
    }
    |termino DIV factor{
        $$ = operacion_prioritaria($1, $3, "/");
        }
    |factor                 {$1;}
;

factor: 
    LPAREN cuenta RPAREN    {$2;}   
    |miembro                {$1;}
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
        for (int i = 0; i < error_count; i++) {
            if (errores[i].line == yylineno) {
            free(errores[i].type); // Liberar memoria previa
            errores[i].type = strdup(s);
            aux = i;
            return; 
            }
        }
        errores[aux].type = strdup(s);
        errores[aux].line = yylineno;
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

struct tokens * dameTokens(char * s1) {
    if (s1 == NULL) {
        fprintf(stderr, "Depuración: La cadena de entrada es NULL.\n");
        return NULL;
    }

    struct tokens * result = (struct tokens *)malloc(sizeof(struct tokens));
    if (result == NULL) {
        return NULL;
    }
    result->contador = 0;
    for (int i = 0; i < 5; i++) {
        result->token[i] = NULL;
    }
    char * s1copy = strdup(s1);
    if (s1copy == NULL) {
        free(result);
        return NULL;
    }
    char * token = strtok(s1copy, " ");
    while (token != NULL && result->contador < 5) {
        result->token[result->contador] = strdup(token);
        if (result->token[result->contador] == NULL) {
            fprintf(stderr, "Error: No se pudo duplicar el token.\n");
            // Liberar memoria asignada antes de salir
            for (int i = 0; i < result->contador; i++) {
                free(result->token[i]);
            }
            free(result);
            free(s1copy);
            return NULL;
        }
        result->contador++;
        token = strtok(NULL, " ");
    }

    if (result->contador == 5 && token != NULL) {
        fprintf(stderr, "Depuración: Se alcanzó el límite de tokens (5). Ignorando el resto.\n");
    }
    free(s1copy);
    return result;
}

bool same_ud_conv(struct tokens * s1, char * s2) {
    if(s1 == NULL || s2 == NULL || strcmp(s2, "")==0) {
        yyerror("Falta elemnto");
        return false;
    }
    struct tokens * unidad = dameTokens(s2);
    char * compare1;
    char * compare2;

    if (s1->contador == 3 && unidad->contador == 2) {
        compare1 = s1->token[1]; 
        compare2 = unidad->token[0];  
    } else if (s1->contador == 5 && unidad->contador == 4) {
        compare1 = s1->token[3]; 
        compare2 = unidad->token[2]; 
    } else if (s1->contador == 3 && unidad->contador == 4) {
        compare1 = s1->token[1]; 
        compare2 = unidad->token[2]; 
    } else if (s1->contador == 5 && unidad->contador == 2) {
        compare1 = s1->token[3]; 
        compare2 = unidad->token[0]; 
    } else {
        yyerror("Error: Formato no válido para las cadenas.\n");
        liberarTokens(unidad); // Liberar memoria
        return false;
    }


    if (strcmp(compare1, compare2) != 0) {
        char error_msg[100];
        snprintf(error_msg, sizeof(error_msg), "Las unidades '%s' y '%s' no son del mismo tipo", compare1, compare2);
        yyerror(error_msg);
        return false;
    }
    liberarTokens(unidad);
    return true;
}

void liberarTokens(struct tokens *tokens) {
    for (int i = 0; i < tokens->contador; i++) {
        free(tokens->token[i]);
    }
    tokens->contador = 0;
}

bool same_ud_oper(struct tokens * s1, struct tokens * s2) {
     if (s1 == NULL || s2 == NULL) {
        yyerror("Faltan argumentos");
        return false;
    }

    char * compare1;
    char * compare2;

    if (s1->contador == 3 && s2->contador == 3) {
        compare1 = s1->token[1]; 
        compare2 = s2->token[1];  
    } else if (s1->contador == 5 && s2->contador == 5) {
        compare1 = s1->token[3]; 
        compare2 = s2->token[3]; 
    } else if (s1->contador == 3 && s2->contador == 5) {
        compare1 = s1->token[1]; 
        compare2 = s2->token[3]; 
    } else if (s1->contador == 5 && s2->contador == 3) {
        compare1 = s1->token[3]; 
        compare2 = s2->token[1]; 
    } else {
        yyerror("Error: Formato no válido para las cadenas.");
        return false;
    }

    if (strcmp(compare1, compare2) != 0) {
        char error_msg[100];
        snprintf(error_msg, sizeof(error_msg), "Las unidades '%s' y '%s' no son del mismo tipo", compare1, compare2);
        yyerror(error_msg);
        return false;
    }

    return true;
}

struct medidas* meassureType(const char* s1) {
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
    
    printf("%s", lev);
    for(int i=0; i<4; i++){
        if(strcmp(levels[i].nombre, lev) == 0){
            printf("%d\n", i);
            return i;
            break;
        }
    }
 }


float pasar_ud_base(float value, const char* op, const char* s2) {
    float result;
    if (strcmp(op, "/") == 0) {
        result = value / atof(s2);
    } else if (strcmp(op, "*") == 0) {
        result = value * atof(s2);
    }
    return result;
}

float pasar_ud_final(float value, const char* op, const char* s2) {
    float result;
    if (strcmp(op, "/") == 0) {
        result = value * atof(s2);
    } else if (strcmp(op, "*") == 0) {
        result = value / atof(s2);
    }
    return result;
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


char * convertir(struct tokens * s1, char * s2){

    struct tokens * unidad = dameTokens(s2);
    int position1;
    int position2;

    float quantity;
    char * resultado;
    struct medidas * medida;


    switch(s1->contador) {
        case 3:
            medida = meassureType(s1->token[1]); 
            position1 = meassureLevel(medida, s1->token[2]);  
            quantity = atof(s1->token[0]); 

            if(position1!=0){
                quantity = quantity * medida[position1].conversion;
            }
            break;

        case 5:
             medida = meassureType(s1->token[3]);  
            position1 = meassureLevel(medida, s1->token[4]); 
            quantity = atof(s1->token[0]);

            if(position1!=0 || (strcmp(s1->token[3], "dinero")==0)){
                yyerror("no puede tener prefijo");
                return "";
            }else{
                quantity = pasar_ud_base(quantity, s1->token[1], s1->token[2]);
            }
            break;
    }

    switch(unidad->contador){
        case 2:
            position2 = meassureLevel(medida, unidad->token[1]);
            if(position2!=0){
                printf("posicion %d", position2);
                printf(" euros %f\n", quantity);
                quantity = quantity * medida[position2].conversion;
                printf("tras conversion %f\n", quantity);
                resultado = malloc(100); 
                snprintf(resultado, 100, "%f %s", quantity, unidad->token[1]);
                break;
            }
        case 4:
            position2 = meassureLevel(medida, unidad->token[3]);
            if(position2!=0){
                yyerror("no puede tener prefijo");
                return "";
            }else{   
                quantity = pasar_ud_final(quantity, unidad->token[0], unidad->token[1]);  
                snprintf(resultado, 100, "%f %s%s", quantity, prefijo(unidad->token[0], unidad->token[1]), unidad->token[3]);
          } 
            break;    
    }
    printf(" el resultado aqui es %s\n",resultado);
    return resultado;
}

struct tokens * operacion_prioritaria(struct tokens * s1, struct tokens * s2, char * signo) {
    fprintf(stderr, "Depuración op_prioritaria: Inicio de la función.\n");

    struct tokens* miembro = malloc(sizeof(struct tokens));
    if (miembro == NULL) {
        fprintf(stderr, "Depuración op_prioritaria: Error al asignar memoria para miembro.\n");
        return NULL;
    }
    fprintf(stderr, "Depuración op_prioritaria: Memoria para miembro asignada correctamente.\n");

    int position1;
    int position2;
    float quantity1 = atof(s1->token[0]);
    float quantity2 = atof(s2->token[0]);
    float resultado;
    struct medidas *medida;
    char * resultado_char;

    fprintf(stderr, "Depuración op_prioritaria: Valores iniciales - quantity1: %.2f, quantity2: %.2f, signo: %s.\n", quantity1, quantity2, signo);

    if (same_ud_oper(s1, s2)) {
        fprintf(stderr, "Depuración op_prioritaria: Las unidades de medida son compatibles.\n");

        switch (s1->contador) {
            case 3:
                fprintf(stderr, "Depuración op_prioritaria: Procesando caso s1->contador = 3.\n");

                medida = meassureType(s1->token[1]);
                position1 = meassureLevel(medida, s1->token[2]);

                if (position1 != 0) {
                    quantity1 = quantity1 * medida[position1].conversion;
                    fprintf(stderr, "Depuración op_prioritaria: quantity1 convertido a %.2f con position1 = %d.\n", quantity1, position1);
                }

                miembro->token[1] = s1->token[1];
                miembro->token[2] = s1->token[2];
                miembro->contador = 3;
                break;

            case 5:
                fprintf(stderr, "Depuración op_prioritaria: Procesando caso s1->contador = 5.\n");

                medida = meassureType(s1->token[3]);
                position1 = meassureLevel(medida, s1->token[4]);

                if (position1 != 0 || (strcmp(s1->token[3], "dinero") == 0)) {
                    fprintf(stderr, "Depuración op_prioritaria: Prefijo inválido en s1.\n");
                    yyerror("no puede tener prefijo");
                    free(miembro);
                    return NULL;
                } else {
                    quantity1 = pasar_ud_base(quantity1, s1->token[1], s1->token[2]);
                    fprintf(stderr, "Depuración op_prioritaria: quantity1 convertido a base %.2f.\n", quantity1);
                }

                miembro->token[1] = s1->token[1];
                miembro->token[2] = s1->token[2];
                miembro->token[3] = s1->token[3];
                miembro->token[4] = s1->token[4];
                miembro->contador = 5;
                break;
        }

        switch (s2->contador) {
            case 3:
                fprintf(stderr, "Depuración op_prioritaria: Procesando caso s2->contador = 3.\n");

                position2 = meassureLevel(medida, s2->token[2]);
                if (position2 != 0) {
                    quantity2 = quantity2 * medida[position2].conversion;
                    fprintf(stderr, "Depuración op_prioritaria: quantity2 convertido a %.2f con position2 = %d.\n", quantity2, position2);
                }
                break;

            case 5:
                fprintf(stderr, "Depuración op_prioritaria: Procesando caso s2->contador = 5.\n");

                position2 = meassureLevel(medida, s2->token[4]);
                if (position2 != 0 || (strcmp(s2->token[3], "dinero") == 0)) {
                    fprintf(stderr, "Depuración op_prioritaria: Prefijo inválido en s2.\n");
                    yyerror("no puede tener prefijo");
                    free(miembro);
                    return NULL;
                } else {
                    quantity2 = pasar_ud_base(quantity2, s2->token[1], s2->token[2]);
                    fprintf(stderr, "Depuración op_prioritaria: quantity2 convertido a base %.2f.\n", quantity2);
                }
                break;
        }

        if (strcmp(signo, "+") == 0) resultado = quantity1 + quantity2;
        else if (strcmp(signo, "-") == 0) resultado = quantity1 - quantity2;
        else if (strcmp(signo, "*") == 0) resultado = quantity1 * quantity2;
        else if (strcmp(signo, "/") == 0) resultado = quantity1 / quantity2;
        else {
            fprintf(stderr, "Depuración op_prioritaria: Operador no reconocido.\n");
            free(miembro);
            return NULL;
        }

        fprintf(stderr, "Depuración op_prioritaria: Resultado de la operación %.2f.\n", resultado);
        fprintf(stderr, "Depuración op_prioritaria: s1->position1 antes de la comparación %d\n", position1);
        fprintf(stderr, "Depuración op_prioritaria: s1->contador antes de la comparación = %d\n", s1->contador);
        fprintf(stderr, "Depuración op_prioritaria: s1->contador es %d, s1->token[0] = %s\n", s1->contador, s1->token[0]);
        int auxiliar = s1->contador;
        printf("Depuración op_prioritaria: auxiliar antes de la comparación = %d\n", auxiliar);

        if (auxiliar == 3) {
            printf("Depuración op_prioritaria: Se ejecuta primera rama");
            if (position1 != 0) {
                resultado = resultado * medida[position1].conversion;
                fprintf(stderr, "Depuración op_prioritaria: Resultado ajustado a %.2f con position1.\n", resultado);
            }
            printf("Depuración op_prioritaria: 1");
        } else {
            printf("Depuración op_prioritaria: Se ejecuta segunda rama");
            resultado = pasar_ud_final(resultado, s1->token[1], s1->token[2]);
            fprintf(stderr, "Depuración op_prioritaria: Resultado convertido a unidad final %.2f.\n", resultado);
        }
        printf("Depuración op_prioritaria: Salida condicional");
        snprintf(miembro->token[0], sizeof(miembro->token[0]), "%.2f", resultado);
        fprintf(stderr, "Depuración op_prioritaria: Resultado formateado en miembro->token[0] = \"%s\".\n", miembro->token[0]);

        return miembro;
    } else {
        fprintf(stderr, "Depuración op_prioritaria: Las unidades de medida no son compatibles.\n");
        yyerror("Las unidades de medida deben ser iguales.");
        free(miembro);
        return NULL;
    }

}

char* token_string(struct tokens *s1) {
    
    char *result = malloc(200 * sizeof(char));
   if (s1->contador == 3) {
        snprintf(result, 200, "%s %s", s1->token[0], s1->token[2]);
    } else if (s1->contador == 5) {
        char* prefix = prefijo(s1->token[1], s1->token[2]);
        if (prefix == NULL) {
            free(result);  
            return NULL; 
        }
        snprintf(result, 200, "%s %s%s", s1->token[0], prefix, s1->token[3]);
        free(prefix);
    }
    return result;  
}
