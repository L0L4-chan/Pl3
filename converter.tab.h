/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_CONVERTER_TAB_H_INCLUDED
# define YY_YY_CONVERTER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ENTERO = 258,                  /* ENTERO  */
    REAL = 259,                    /* REAL  */
    OPE1 = 260,                    /* OPE1  */
    OPE2 = 261,                    /* OPE2  */
    PLUS = 262,                    /* PLUS  */
    MINUS = 263,                   /* MINUS  */
    MUL = 264,                     /* MUL  */
    DIV = 265,                     /* DIV  */
    DELIM = 266,                   /* DELIM  */
    LPAREN = 267,                  /* LPAREN  */
    RPAREN = 268,                  /* RPAREN  */
    ARROW = 269,                   /* ARROW  */
    MEAN = 270,                    /* MEAN  */
    MODE = 271,                    /* MODE  */
    MEDIAN = 272,                  /* MEDIAN  */
    GBP = 273,                     /* GBP  */
    YEN = 274,                     /* YEN  */
    DOLLAR = 275,                  /* DOLLAR  */
    EURO = 276,                    /* EURO  */
    GRAMO = 277,                   /* GRAMO  */
    STONE = 278,                   /* STONE  */
    POUND = 279,                   /* POUND  */
    ONZA = 280,                    /* ONZA  */
    LITRO = 281,                   /* LITRO  */
    PINTA = 282,                   /* PINTA  */
    GALLON = 283,                  /* GALLON  */
    BARRIL = 284,                  /* BARRIL  */
    METRO = 285,                   /* METRO  */
    YARDA = 286,                   /* YARDA  */
    PIE = 287,                     /* PIE  */
    MILE = 288,                    /* MILE  */
    MILI = 289,                    /* MILI  */
    DECI = 290,                    /* DECI  */
    CENTI = 291,                   /* CENTI  */
    DECA = 292,                    /* DECA  */
    HECTO = 293,                   /* HECTO  */
    KILO = 294                     /* KILO  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define ENTERO 258
#define REAL 259
#define OPE1 260
#define OPE2 261
#define PLUS 262
#define MINUS 263
#define MUL 264
#define DIV 265
#define DELIM 266
#define LPAREN 267
#define RPAREN 268
#define ARROW 269
#define MEAN 270
#define MODE 271
#define MEDIAN 272
#define GBP 273
#define YEN 274
#define DOLLAR 275
#define EURO 276
#define GRAMO 277
#define STONE 278
#define POUND 279
#define ONZA 280
#define LITRO 281
#define PINTA 282
#define GALLON 283
#define BARRIL 284
#define METRO 285
#define YARDA 286
#define PIE 287
#define MILE 288
#define MILI 289
#define DECI 290
#define CENTI 291
#define DECA 292
#define HECTO 293
#define KILO 294

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 72 "converter.y"

    char * valString;
    struct tokens * valToken;
    int valInt;
    float valFloat;

#line 152 "converter.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_CONVERTER_TAB_H_INCLUDED  */
