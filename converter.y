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


tokens dameTokens(char * s1);
bool same_ud_conv(tokens * s1, char * s2);
bool same_ud_oper(tokens * s1, tokens * s2);
const char* meassureType(const char* s1);
int meassureLevel(medidas[] levels, char* lev);
float pasar_ud_base(float value, const char* op, const char* s2);
float pasar_ud_final(float value, const char* op, const char* s2);
char* prefijo (char * s1, char * s2);
char * convertir(tokens * s1, char * s2);
tokens operacion_prioritaria(tokens s1, tokens s2, char signo);
char * token_string(tokens s1);

struct medidas distancia[4];
distancia[0].nombre = "metro";
distancia[0].conversion = 1;
distancia[1].nombre = "yarda";
distancia[1].conversion = 1.09;
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
capacidad[0].nombre = "litro";
capacidad[0].conversion = 1;
capacidad[1].nombre = "pinta";
capacidad[1].conversion = 2.11;
capacidad[2].nombre = "gallon";
capacidad[2].conversion = 0.26;
capacidad[3].nombre = "barril";
capacidad[3].conversion = 0.0063;

%}

%union {
    char * valString;
    tokens * valToken;
    int valInt;
    float valfloat;
}

%token <valInt> ENTERO
%token <valfloat> REAL
%token OPE1 OPE2 PLUS MINUS MUL DIV DELIM LPAREN RPAREN ARROW MEAN MODE MEDIAN 
%token GBP YEN DOLLAR EURO GRAMO STONE POUND ONZA LITRO PINTA GALLON BARRIL METRO YARDA PIE MILE 
%token MILI DECI CENTI DECA HECTO KILO 
%type <valString>  conversion unidad ud prefijo operacion 
%type <valToken> miembro cuenta factor termino


%start S

%%

S:  OPE1 conversion {
    if (strcmp ($2, "")!=0)
        printf("El resultado de la conversión es: %s",$2);
    }
    | OPE2 operacion {
        if (strcmp ($2, "")!=0)
            printf("El resultado de la operación es: %s",$2);
    }
;


conversion:
    miembro ARROW unidad {
        if (same_ud_conv($1, $3)){$$ = convertir($1, $3);}
    }
;


miembro:
    ENTERO unidad {
        strcat(to_string($1), $2);
        $$ = dameTokens($1);
        }
    |REAL unidad {
        strcat(to_string($1), $2);
        $$ = dameTokens($1);
        }
    ;

unidad:
    ud              {$1}
    | prefijo ud    {strcat($1, $2);}
;


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
    MILI            { $$ = "/ 1000 "}
    |DECI           { $$ = "/ 10 "}
    |CENTI          { $$ = "/ 100 "}
    |DECA           { $$ = "* 10 "}
    |HECTO          { $$ = "* 100 "}
    |KILO           { $$ = "* 1000 "}


operacion: 
     cuenta           {$$ = token_string($1)}      
;

cuenta: 
    cuenta PLUS termino{
        $$ = operacion_prioritaria($1, $3, "+");
    }
    |cuenta MINUS termino{
        $$ = operacion_prioritaria($1, $3, "-");
    }
    | termino                              {$1}
;

termino: 
    termino MUL factor {
        $$ = operacion_prioritaria($1, $3, "*");
    }
    |termino DIV factor{
        $$ = operacion_prioritaria($1, $3, "/");
        }
    |factor                 {$1}
;

factor: 
    LPAREN cuenta RPAREN    {$2}   
    |miembro                {$1}
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

tokens dameTokens(char * s1){   
    char tokens1[5];
    int count1 = 0;
    tokens result;

    char * token = strtok(s1, " ");
    while (token != NULL && count1 < 4) {
        tokens1[count1++] = token;
        token = strtok(NULL, " ");
    }


    result.token=tokens1;
    result.count1=count1;

    return result;
}


bool same_ud_conv(tokens * s1, char * s2) {

    tokens unidad = dameTokens(s2)
    char * compare1;
    char * compare2;

    if (s1.countador == 3 && unidad.contador == 2) {
        compare1 = s1.token[1]; 
        compare2 = unidad.token[0];  
    } else if (s1.countador == 5 && unidad.contador == 4) {
        compare1 = s1.token[3]; 
        compare2 = unidad.token[2]; 
    } else if (s1.countador == 3 && unidad.contador == 4) {
        compare1 = s1.token[1]; 
        compare2 = unidad.token[2]; 
    } else if (s1.countador == 5 && unidad.contador == 2) {
        compare1 = s1.token[3]; 
        compare2 = unidad.token[0]; 
    } else {
        yyerror("Error: Formato no válido para las cadenas.\n");
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

bool same_ud_oper(tokens * s1, tokens * s2) {

    char * compare1;
    char * compare2;

    if (s1.countador == 3 && s2.contador == 3) {
        compare1 = s1.token[1]; 
        compare2 = s2.token[1];  
    } else if (s1.countador == 5 && s2.contador == 5) {
        compare1 = s1.token[3]; 
        compare2 = s2.token[3]; 
    } else if (s1.countador == 3 && s2.contador == 5) {
        compare1 = s1.token[1]; 
        compare2 = s2.token[3]; 
    } else if (s1.countador == 5 && s2.contador == 3) {
        compare1 = s1.token[3]; 
        compare2 = s2.token[1]; 
    } else {
        yyerror("Error: Formato no válido para las cadenas.\n");
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

const char* meassureType(const char* s1) {
    if (strcmp(s1, "dinero") == 0) return monedas;
    if (strcmp(s1, "peso") == 0) return peso;
    if (strcmp(s1, "capacidad") == 0) return capacidad;
    if (strcmp(s1, "distancia") == 0) return distancia;
    return NULL;
}

 int meassureLevel(medidas[] levels, char* lev){
    for(int i=0; i<4; i++){
        if(strcmp(levels[i].name, lev) == 0){
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

    if (strcmp ((strcat(s1,s2)), "/1000") == 0)
        return "mili";
    else if (strcmp ((strcat(s1,s2)), "/100") == 0)
        return "centi";
    else if (strcmp ((strcat(s1,s2)), "/10") == 0)
        return "deci";    
    else if (strcmp ((strcat(s1,s2)), "*1000") == 0)
        return "kilo";
    else if (strcmp ((strcat(s1,s2)), "*100") == 0)
        return "hecto";
    else if (strcmp ((strcat(s1,s2)), "*10") == 0)
        return "deca"; 
}


char * convertir(tokens * s1, char * s2){

    tokens unidad = dameTokens(s2)
    char * compare1;
    char * compare2;

    int position1;
    int position2;

    float quantity;
    char * resultado;
    struct medidas medida[4];


    switch(s1.contador) {
        case 3:
            medida = meassureType(s1.token[1]);   
            position1 = meassureLevel(medida, s1.token[2]);
            quantity = atof(s1.token[0]);

            if(position1!=0){
                quantity = quantity * medida[position1].conversion;
            }
            break;

        case 5:
            medida = meassureType(s1.token[3]);  
            position1 = meassureLevel(medida, s1.token[4]);
            quantity = atof(s1.token[0]);

            if(position1!=0 || (strcmp(s1.token[3], "dinero")==0)){
                yyerror("no puede tener prefijo");
                return "";
            }else{
                quantity = pasar_ud_base(quantity, s1.token[1], s1.token[2]);
            }
            break;
    }

    switch(unidad.contador){
        case 2:
            position2 = meassureLevel(medida, unidad.token[1]);
            if(position2!=0){
                quantity = quantity * medida[position2].conversion;
                resultado = to_string (strcat(quantity,unidad.token[1]))
                break;
            }
        case 4:
            position2 = meassureLevel(medida, unidad.token[3]);
            if(position2!=0){
                yyerror("no puede tener prefijo");
                return "";
            }else{   
                quantity = pasar_ud_final(quantity, unidad.token[0], unidad.token[1]); 
                resultado = to_string (strcat(quantity,strcat(prefijo(unidad.token[0], unidad.token[1]),unidad.token[3])))
            } 
            break;
        
    }

    return resultado;
}

token operacion_prioritaria(token s1, token s2, char signo) {

    tokens miembro;  
    int position1;
    int position2;
    float quantity1;
    float quantity2;
    struct medidas medida[4];
    float resultado;
    char * resultado_char;
    char unidad_resultado[4];

    if (same_ud_oper(s1, s2)){
        switch(s1.contador) {
            case 3:
                medida = meassureType(s1.token[1]);   
                position1 = meassureLevel(medida, s1.token[2]);
                quantity1 = atof(s1.token[0]);

                if(position1!=0){
                    quantity1 = quantity1 * medida[position1].conversion;
                }
                unidad_resultado[0] = s1.token[1];
                unidad_resultado[1] = s1.token[2];
                break;

            case 5:
                medida = meassureType(s1.token[3]);  
                position1 = meassureLevel(medida, s1.token[4]);
                quantity1 = atof(s1.token[0]);

                if(position1!=0 || (strcmp(s1.token[3], "dinero")==0)){
                    yyerror("no puede tener prefijo");
                    return "";
                }else{
                    quantity1 = pasar_ud_base(quantity1, s1.token[1], s1.token[2]);
                }
                unidad_resultado[0] = s1.token[1];
                unidad_resultado[1] = s1.token[2];
                unidad_resultado[2] = s1.token[3];
                unidad_resultado[3] = s1.token[4];

                break;
        }

        switch(s2.contador) {
            case 3:
                medida = meassureType(s2.token[1]);   
                position2 = meassureLevel(medida, s2.token[2]);
                quantity2 = atof(s1.token[0]);

                if(position1!=0){
                    quantity2 = quantity2 * medida[position2].conversion;
                }

            case 5:
                medida = meassureType(s2.token[3]);  
                position2 = meassureLevel(medida, s2.token[4]);
                quantity2 = atof(s2.token[0]);

                if(position2!=0 || (strcmp(s2.token[3], "dinero")==0)){
                    yyerror("no puede tener prefijo");
                    return "";
                }else{
                    quantity2 = pasar_ud_base(quantity2, s2.token[1], s2.token[2]);
                }

            break;
        }

        switch(signo) {
            case "+":
                resultado = quantity1 + quantity2;
                break;
            case "-":
                resultado = quantity1 - quantity2;
                break;
            case "*":
                resultado = quantity1 * quantity2;
                break;
            case "/":
                resultado = quantity1 / quantity2;
                break;
        }

        if (unidad_resultado[2]==NULL && unidad_resultado[3]==NULL){
            if(position1!=0){
            resultado = resultado * medida[position1].conversion;
          }
            resultado_char = to_string(resultado);
            resultado_char = strcat (resultado_char, " ");
            resultado_char = strcat (resultado_char, unidad_resultado[0]);
            resultado_char = strcat (resultado_char, " ");
            resultado_char = strcat (resultado_char, unidad_resultado[1]);
            miembro = dameTokens(resultado_char);
        }
        else {
            resultado = pasar_ud_final(resultado, unidad_resultado[2], unidad_resultado[3]);
            resultado_char = to_string(resultado);
            resultado_char = strcat (resultado_char, " ");
            resultado_char = strcat (resultado_char, unidad_resultado[0]);
            resultado_char = strcat (resultado_char, " ");
            resultado_char = strcat (resultado_char, unidad_resultado[1]);
            resultado_char = strcat (resultado_char, " ");
            resultado_char = strcat (resultado_char, unidad_resultado[2]);
            resultado_char = strcat (resultado_char, " ");
            resultado_char = strcat (resultado_char, unidad_resultado[3]);
            miembro = dameTokens(resultado_char);
        }
    }
    return miembro
}

char * token_string(token s1){

    if (s1.contador == 3){
        return strcat(s1.token[0],s1.token[2]);
    }
    else if (s1.contador == 5){
        char * prefix = prefijo(s1.token[1], s1.token[2]);
        char * respuesta = strcat(s1.token[0], prefix);
        respuesta = strcat(respuesta, s1.token[3]);
    }
}
