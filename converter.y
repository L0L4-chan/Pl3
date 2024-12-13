%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


struct medidas{
    char* nombre;
    float conversion
};

struct medidas distancia[4];
struct medidas monedas[4];
struct medidas peso[4];
struct medidas capacidad[4];

struct er {
    char* type; 
    int line;
};


struct op operaciones[100];

struct op {
    char op;
    float first;
    float second;
    int prioridad;
};

struct tokens {
    char* token[5];
    int contador;
};

struct tokens tk1;
struct tokens tk2;


struct er errores[100];
int contador_errores = 0;
int error_count = 0;
int priority[100];

extern int yylex();
extern int yylineno;

void yyerror(const char *s);
void print_errors();
void same_tag(char * s1, char * s2);
float converter(const char *s1, const char *s2);
struct medidas* meassureType(const char *type);
int meassureLevel(struct medidas* levels, const char* unit);
float escale(float value, const char* op, const char* factor);

void inicializar_medidas() {
    // Inicializar distancia
    distancia[0] = (struct medidas){"metro", 1};
    distancia[1] = (struct medidas){"yarda", 1.09};
    distancia[2] = (struct medidas){"pie", 3.28};
    distancia[3] = (struct medidas){"mile", 0.00062};

    // Inicializar monedas
    monedas[0] = (struct medidas){"euro", 1};
    monedas[1] = (struct medidas){"dolar", 1.05};
    monedas[2] = (struct medidas){"gbp", 0.83};
    monedas[3] = (struct medidas){"yen", 156.67};

    // Inicializar peso
    peso[0] = (struct medidas){"gramo", 1};
    peso[1] = (struct medidas){"pound", 0.0022};
    peso[2] = (struct medidas){"onza", 0.035};
    peso[3] = (struct medidas){"stone", 0.00016};

    // Inicializar capacidad
    capacidad[0] = (struct medidas){"litro", 1};
    capacidad[1] = (struct medidas){"pinta", 2.11};
    capacidad[2] = (struct medidas){"gallon", 0.26};
    capacidad[3] = (struct medidas){"barril", 0.0063};
}

%}

%union {
    char * valString;
    int valInt;
    float valFloat;
}

%token OPE1 OPE2 ENTERO REAL PLUS MINUS MUL DIV MOD DELIM LPAREN RPAREN ARROW MEAN MODE MEDIAN 
%token GBP YEN DOLLAR EURO GRAMO STONE POUND ONZA LITRO PINTA GALLON BARRIL METRO YARDA PIE MILE 
%token MILI DECI CENTI DECA HECTO KILO 
%token <valString>  conversion, operacion, unidad, ud , prefijo, listas cuenta,


%start S
%%

S:  OPE1 conversion { printf("Resultado de la conversión: %.2f\n", $2); }
    | OPE2 operacion { printf("Resultado de la operación: %.2f\n", $2); }
    ;

conversion:
    miembro ARROW unidad {
            if(same_tag($1, $3)) {
                $$ = converter($1,$3); 
                if (strcmp($$, "")!=0){
                    printf("El resultado es %f %s", $$, $3);
                }
            }        
    };

operacion:
      MEAN lista { $$ = calcular_media($2); }
    | MEDIAN lista { $$ = calcular_mediana($2); }
    | MODE lista { $$ = calcular_moda($2); }
    | cuenta { $$ = $1; }
    ;


unidad:
    ud              {$$ = $1;}
    | prefijo ud    {strcat($1, $2)}


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

miembro:
    ENTERO unidad   { $$ = atof($1); }
  | REAL unidad     { $$ = atof($1); }
  | ENTERO          { $$ = atof($1); }
  | REAL            { $$ = atof($1); }
  ;

lista:
    miembro            { $$ = $1; }
  | lista miembro      { $$ = $1 + $2; }
  ;

cuenta: 
miembro signo miembro {  

    if(same_tag($1, $3)) {  
        $$ = oper($1, $2, $3); // TODO FUNCION operacion
    }
}
| cuenta signo miembro
| cuenta signo float unidad
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


bool same_tag(char *s1, char *s2) {
    char *tokens1[5];  
    char *tokens2[4];
    char *compare1; 
    char *compare2;

    int count1 = 0;
    int count2 = 0;

    char *token = strtok(s1, " ");
    while (token != NULL && count1 < 5) {
        tokens1[count1++] = token;
        token = strtok(NULL, " ");
    }

    token = strtok(s2, " ");
    while (token != NULL && count2 < 4) {
        tokens2[count2++] = token;
        token = strtok(NULL, " ");
    }

  

    if (count1 == 3 && count2 == 2) {
        compare1 = tokens1[1]; 
        compare2 = tokens2[0];  
    } else if (count1 == 5 && count2 == 4) {
        compare1 = tokens1[3];  
        compare2 = tokens2[2];  
    } else if (count1 == 3 && count2 == 4) {
        compare1 = tokens1[1];  
        compare2 = tokens2[2]; 
    } else if (count1 == 5 && count2 == 2) {
        compare1 = tokens1[3];  
        compare2 = tokens2[0]; 
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

float converter(const char* s1, const char* s2) {
    struct medidas* medida = meassureType(s1);
    if (!medida) {
        yyerror("Tipo de medida no encontrado.");
        return -1;
    }

    int pos1 = meassureLevel(medida, s1);
    int pos2 = meassureLevel(medida, s2);

    if (pos1 == -1 || pos2 == -1) {
        yyerror("Unidad no reconocida.");
        return -1;
    }

    float factor = medida[pos2].conversion / medida[pos1].conversion;
    return factor;
}


const char* meassureType(const char* s1) {
    if (strcmp(s1, "dinero") == 0) return monedas;
    if (strcmp(s1, "peso") == 0) return peso;
    if (strcmp(s1, "capacidad") == 0) return capacidad;
    if (strcmp(s1, "distancia") == 0) return distancia;
    return NULL;
}

 int meassureLevel(struct medidas* levels, char* lev){
    for(int i=0; i<4; i++){
        if(strcmp(levels[i].name, lev) == 0){
            return i;
            break;
        }
    }
 }

float escale(float value, const char* op, const char* s2) {
    float result;
    if (strcmp(op, "/") == 0) {
        result = value / atof(s2);
    } else if (strcmp(op, "*") == 0) {
        result = value * atof(s2);
    }
    return result;
}

char* oper(char* s1, char s2, char* s3){
    
    char *tokens1[5];  
    char *tokens2[5];

    int count1 = 0;
    int count2 = 0;

    float first;
    float second;

    struct medidas medida[4];
    
    char *token = strtok(s1, " ");
    while (token != NULL && count1 < 5) {
        tokens1[count1++] = token;
        token = strtok(NULL, " ");
    }

    token = strtok(s2, " ");
    while (token != NULL && count2 < 4) {
        tokens2[count2++] = token;
        token = strtok(NULL, " ");
    }

    if(count1 == 3){
        medidas = meassureType(token1[1]); 
        position1 = meassureLevel(medida, tokens1[2]);
        first = atof(tokens1[0]);
        if(position1!=0){
            quantity = quantity * levels[position1].conversion;
        }

    }else{
        medidas = meassureType(tokens1[3]);
        position1 = meassureLevel(medida, tokens1[4]); 
        first = atof(tokens1[0]);
        if(position1!=0 || (strcmp(token1[3], ""dinero")==0)){
           yyerror("no puede tener prefijo");
           return "";
        }else{
            first = escale(quantity, token1[1], token1[2]);
        }
    }

    if(count2 == 3){
        medidas = meassureType(token2[1]); 
        position2 = meassureLevel(medida, tokens2[2]);
        second = atof(tokens2[0]);
        if(position2!=0){
            quantity = quantity * levels[position2].conversion;
        }

    }else{
        medidas = meassureType(tokens2[3]);
        position2 = meassureLevel(medida, tokens2[4]); 
        first = atof(tokens2[0]);
        if(position2!=0 || (strcmp(token2[3], ""dinero")==0)){
           yyerror("no puede tener prefijo");
           return "";
        }else{
            first = escale(quantity, token2[1], token2[2]);
        }

        
                
    } 
} 
