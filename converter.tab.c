/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "converter.y"

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
bool same_ud_conv(token * s1, char * s2);
bool same_ud_oper(token * s1, token * s2);
const char* meassureType(const char* s1);
int meassureLevel(medidas[] levels, char* lev);
float pasar_ud_base(float value, const char* op, const char* s2);
float pasar_ud_final(float value, const char* op, const char* s2);
char* prefijo (char * s1, char * s2);
char * convertir(token * s1, char * s2);
token operacion_prioritaria(token s1, token s2, char signo);
char * token_string(token s1);

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


#line 155 "converter.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "converter.tab.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_ENTERO = 3,                     /* ENTERO  */
  YYSYMBOL_REAL = 4,                       /* REAL  */
  YYSYMBOL_OPE1 = 5,                       /* OPE1  */
  YYSYMBOL_OPE2 = 6,                       /* OPE2  */
  YYSYMBOL_PLUS = 7,                       /* PLUS  */
  YYSYMBOL_MINUS = 8,                      /* MINUS  */
  YYSYMBOL_MUL = 9,                        /* MUL  */
  YYSYMBOL_DIV = 10,                       /* DIV  */
  YYSYMBOL_DELIM = 11,                     /* DELIM  */
  YYSYMBOL_LPAREN = 12,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 13,                    /* RPAREN  */
  YYSYMBOL_ARROW = 14,                     /* ARROW  */
  YYSYMBOL_MEAN = 15,                      /* MEAN  */
  YYSYMBOL_MODE = 16,                      /* MODE  */
  YYSYMBOL_MEDIAN = 17,                    /* MEDIAN  */
  YYSYMBOL_GBP = 18,                       /* GBP  */
  YYSYMBOL_YEN = 19,                       /* YEN  */
  YYSYMBOL_DOLLAR = 20,                    /* DOLLAR  */
  YYSYMBOL_EURO = 21,                      /* EURO  */
  YYSYMBOL_GRAMO = 22,                     /* GRAMO  */
  YYSYMBOL_STONE = 23,                     /* STONE  */
  YYSYMBOL_POUND = 24,                     /* POUND  */
  YYSYMBOL_ONZA = 25,                      /* ONZA  */
  YYSYMBOL_LITRO = 26,                     /* LITRO  */
  YYSYMBOL_PINTA = 27,                     /* PINTA  */
  YYSYMBOL_GALLON = 28,                    /* GALLON  */
  YYSYMBOL_BARRIL = 29,                    /* BARRIL  */
  YYSYMBOL_METRO = 30,                     /* METRO  */
  YYSYMBOL_YARDA = 31,                     /* YARDA  */
  YYSYMBOL_PIE = 32,                       /* PIE  */
  YYSYMBOL_MILE = 33,                      /* MILE  */
  YYSYMBOL_MILI = 34,                      /* MILI  */
  YYSYMBOL_DECI = 35,                      /* DECI  */
  YYSYMBOL_CENTI = 36,                     /* CENTI  */
  YYSYMBOL_DECA = 37,                      /* DECA  */
  YYSYMBOL_HECTO = 38,                     /* HECTO  */
  YYSYMBOL_KILO = 39,                      /* KILO  */
  YYSYMBOL_YYACCEPT = 40,                  /* $accept  */
  YYSYMBOL_S = 41,                         /* S  */
  YYSYMBOL_conversion = 42,                /* conversion  */
  YYSYMBOL_miembro = 43,                   /* miembro  */
  YYSYMBOL_unidad = 44,                    /* unidad  */
  YYSYMBOL_ud = 45,                        /* ud  */
  YYSYMBOL_prefijo = 46,                   /* prefijo  */
  YYSYMBOL_operacion = 47,                 /* operacion  */
  YYSYMBOL_cuenta = 48,                    /* cuenta  */
  YYSYMBOL_termino = 49,                   /* termino  */
  YYSYMBOL_factor = 50                     /* factor  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  14
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   62

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  40
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  11
/* YYNRULES -- Number of rules.  */
#define YYNRULES  39
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  54

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   294


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,   105,   105,   109,   117,   124,   128,   135,   136,   141,
     142,   143,   144,   145,   146,   147,   148,   149,   150,   151,
     152,   153,   154,   155,   156,   160,   161,   162,   163,   164,
     165,   169,   173,   176,   179,   183,   186,   189,   193,   194
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "ENTERO", "REAL",
  "OPE1", "OPE2", "PLUS", "MINUS", "MUL", "DIV", "DELIM", "LPAREN",
  "RPAREN", "ARROW", "MEAN", "MODE", "MEDIAN", "GBP", "YEN", "DOLLAR",
  "EURO", "GRAMO", "STONE", "POUND", "ONZA", "LITRO", "PINTA", "GALLON",
  "BARRIL", "METRO", "YARDA", "PIE", "MILE", "MILI", "DECI", "CENTI",
  "DECA", "HECTO", "KILO", "$accept", "S", "conversion", "miembro",
  "unidad", "ud", "prefijo", "operacion", "cuenta", "termino", "factor", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-18)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int8 yypact[] =
{
      22,    26,    20,    33,   -17,   -17,   -18,    43,    20,   -18,
     -18,    27,    44,   -18,   -18,   -18,   -18,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,    19,
     -18,   -17,    18,    20,    20,    20,    20,   -18,   -18,   -18,
      44,    44,   -18,   -18
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,     0,     0,     0,     0,     2,     0,     0,    39,
       3,    31,    34,    37,     1,    10,     9,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,     5,     7,     0,
       6,     0,     0,     0,     0,     0,     0,     8,     4,    38,
      32,    33,    35,    36
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -18,   -18,   -18,    59,    -5,    23,   -18,   -18,    53,    12,
      13
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,     3,     6,     9,    37,    38,    39,    10,    11,    12,
      13
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      40,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,     4,     5,    43,    44,     1,     2,     4,
       5,    49,     8,    14,    43,    44,    48,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    45,    46,    50,    51,    41,    52,    53,
       7,    42,    47
};

static const yytype_int8 yycheck[] =
{
       5,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,     3,     4,     7,     8,     5,     6,     3,
       4,    13,    12,     0,     7,     8,    41,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,     9,    10,    43,    44,    14,    45,    46,
       1,     8,    39
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     5,     6,    41,     3,     4,    42,    43,    12,    43,
      47,    48,    49,    50,     0,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    44,    45,    46,
      44,    14,    48,     7,     8,     9,    10,    45,    44,    13,
      49,    49,    50,    50
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    40,    41,    41,    42,    43,    43,    44,    44,    45,
      45,    45,    45,    45,    45,    45,    45,    45,    45,    45,
      45,    45,    45,    45,    45,    46,    46,    46,    46,    46,
      46,    47,    48,    48,    48,    49,    49,    49,    50,    50
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     2,     2,     3,     2,     2,     1,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     3,     3,     1,     3,     3,     1,     3,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* S: OPE1 conversion  */
#line 105 "converter.y"
                    {
    if (strcmp ((yyvsp[0].valString), "")!=0)
        printf("El resultado de la conversión es: %s",(yyvsp[0].valString));
    }
#line 1228 "converter.tab.c"
    break;

  case 3: /* S: OPE2 operacion  */
#line 109 "converter.y"
                     {
        if (strcmp ((yyvsp[0].valString), "")!=0)
            printf("El resultado de la operación es: %s",(yyvsp[0].valString));
    }
#line 1237 "converter.tab.c"
    break;

  case 4: /* conversion: miembro ARROW unidad  */
#line 117 "converter.y"
                         {
        if (same_ud_conv((yyvsp[-2].valToken), (yyvsp[0].valString))){(yyval.valString) = convertir((yyvsp[-2].valToken), (yyvsp[0].valString));}
    }
#line 1245 "converter.tab.c"
    break;

  case 5: /* miembro: ENTERO unidad  */
#line 124 "converter.y"
                  {
        strcat(to_string((yyvsp[-1].valInt)), (yyvsp[0].valString));
        (yyval.valToken) = dameTokens((yyvsp[-1].valInt));
        }
#line 1254 "converter.tab.c"
    break;

  case 6: /* miembro: REAL unidad  */
#line 128 "converter.y"
                 {
        strcat(to_string((yyvsp[-1].valfloat)), (yyvsp[0].valString));
        (yyval.valToken) = dameTokens((yyvsp[-1].valfloat));
        }
#line 1263 "converter.tab.c"
    break;

  case 7: /* unidad: ud  */
#line 135 "converter.y"
                    {(yyvsp[0].valString)}
#line 1269 "converter.tab.c"
    break;

  case 8: /* unidad: prefijo ud  */
#line 136 "converter.y"
                    {strcat((yyvsp[-1].valString), (yyvsp[0].valString));}
#line 1275 "converter.tab.c"
    break;

  case 9: /* ud: YEN  */
#line 141 "converter.y"
                    { (yyval.valString) = "dinero yen "}
#line 1281 "converter.tab.c"
    break;

  case 10: /* ud: GBP  */
#line 142 "converter.y"
                    { (yyval.valString) = "dinero gbp "}
#line 1287 "converter.tab.c"
    break;

  case 11: /* ud: DOLLAR  */
#line 143 "converter.y"
                    { (yyval.valString) = "dinero dollar" }
#line 1293 "converter.tab.c"
    break;

  case 12: /* ud: EURO  */
#line 144 "converter.y"
                    { (yyval.valString) = "dinero euro "}
#line 1299 "converter.tab.c"
    break;

  case 13: /* ud: GRAMO  */
#line 145 "converter.y"
                    { (yyval.valString) = "peso gr "}
#line 1305 "converter.tab.c"
    break;

  case 14: /* ud: STONE  */
#line 146 "converter.y"
                    { (yyval.valString) = "peso stone "}
#line 1311 "converter.tab.c"
    break;

  case 15: /* ud: POUND  */
#line 147 "converter.y"
                    { (yyval.valString) = "peso libra "}
#line 1317 "converter.tab.c"
    break;

  case 16: /* ud: ONZA  */
#line 148 "converter.y"
                    { (yyval.valString) = "peso onza "}
#line 1323 "converter.tab.c"
    break;

  case 17: /* ud: LITRO  */
#line 149 "converter.y"
                    { (yyval.valString) = "capacidad l "}
#line 1329 "converter.tab.c"
    break;

  case 18: /* ud: PINTA  */
#line 150 "converter.y"
                    { (yyval.valString) = "capacidad pinta "}
#line 1335 "converter.tab.c"
    break;

  case 19: /* ud: GALLON  */
#line 151 "converter.y"
                    { (yyval.valString) = "capacidad galon "}
#line 1341 "converter.tab.c"
    break;

  case 20: /* ud: BARRIL  */
#line 152 "converter.y"
                    { (yyval.valString) = "capacidad barril "}
#line 1347 "converter.tab.c"
    break;

  case 21: /* ud: METRO  */
#line 153 "converter.y"
                    { (yyval.valString) = "distancia m "}
#line 1353 "converter.tab.c"
    break;

  case 22: /* ud: YARDA  */
#line 154 "converter.y"
                    { (yyval.valString) = "distancia yarda "}
#line 1359 "converter.tab.c"
    break;

  case 23: /* ud: PIE  */
#line 155 "converter.y"
                    { (yyval.valString) = "distancia pie "}
#line 1365 "converter.tab.c"
    break;

  case 24: /* ud: MILE  */
#line 156 "converter.y"
                    { (yyval.valString) = "distancia milla "}
#line 1371 "converter.tab.c"
    break;

  case 25: /* prefijo: MILI  */
#line 160 "converter.y"
                    { (yyval.valString) = "/ 1000 "}
#line 1377 "converter.tab.c"
    break;

  case 26: /* prefijo: DECI  */
#line 161 "converter.y"
                    { (yyval.valString) = "/ 10 "}
#line 1383 "converter.tab.c"
    break;

  case 27: /* prefijo: CENTI  */
#line 162 "converter.y"
                    { (yyval.valString) = "/ 100 "}
#line 1389 "converter.tab.c"
    break;

  case 28: /* prefijo: DECA  */
#line 163 "converter.y"
                    { (yyval.valString) = "* 10 "}
#line 1395 "converter.tab.c"
    break;

  case 29: /* prefijo: HECTO  */
#line 164 "converter.y"
                    { (yyval.valString) = "* 100 "}
#line 1401 "converter.tab.c"
    break;

  case 30: /* prefijo: KILO  */
#line 165 "converter.y"
                    { (yyval.valString) = "* 1000 "}
#line 1407 "converter.tab.c"
    break;

  case 31: /* operacion: cuenta  */
#line 169 "converter.y"
                      {(yyval.valString) = token_string((yyvsp[0].valToken))}
#line 1413 "converter.tab.c"
    break;

  case 32: /* cuenta: cuenta PLUS termino  */
#line 173 "converter.y"
                       {
        (yyval.valToken) = operacion_prioritaria((yyvsp[-2].valToken), (yyvsp[0].valToken), "+");
    }
#line 1421 "converter.tab.c"
    break;

  case 33: /* cuenta: cuenta MINUS termino  */
#line 176 "converter.y"
                         {
        (yyval.valToken) = operacion_prioritaria((yyvsp[-2].valToken), (yyvsp[0].valToken), "-");
    }
#line 1429 "converter.tab.c"
    break;

  case 34: /* cuenta: termino  */
#line 179 "converter.y"
                                           {(yyvsp[0].valToken)}
#line 1435 "converter.tab.c"
    break;

  case 35: /* termino: termino MUL factor  */
#line 183 "converter.y"
                       {
        (yyval.valToken) = operacion_prioritaria((yyvsp[-2].valToken), (yyvsp[0].valToken), "*");
    }
#line 1443 "converter.tab.c"
    break;

  case 36: /* termino: termino DIV factor  */
#line 186 "converter.y"
                       {
        (yyval.valToken) = operacion_prioritaria((yyvsp[-2].valToken), (yyvsp[0].valToken), "/");
        }
#line 1451 "converter.tab.c"
    break;

  case 37: /* termino: factor  */
#line 189 "converter.y"
                            {(yyvsp[0].valToken)}
#line 1457 "converter.tab.c"
    break;

  case 38: /* factor: LPAREN cuenta RPAREN  */
#line 193 "converter.y"
                            {(yyvsp[-1].valToken)}
#line 1463 "converter.tab.c"
    break;

  case 39: /* factor: miembro  */
#line 194 "converter.y"
                            {(yyvsp[0].valToken)}
#line 1469 "converter.tab.c"
    break;


#line 1473 "converter.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 198 "converter.y"


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


bool same_ud_conv(token * s1, char * s2) {

    token unidad = dameTokens(s2)
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

bool same_ud_oper(token * s1, token * s2) {

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


char * convertir(token * s1, char * s2){

    token unidad = dameTokens(s2)
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

    token miembro;  
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
