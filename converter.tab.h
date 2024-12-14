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
    REAL = 258,                    /* REAL  */
    OPE1 = 259,                    /* OPE1  */
    OPE2 = 260,                    /* OPE2  */
    PLUS = 261,                    /* PLUS  */
    MINUS = 262,                   /* MINUS  */
    MUL = 263,                     /* MUL  */
    DIV = 264,                     /* DIV  */
    DELIM = 265,                   /* DELIM  */
    LPAREN = 266,                  /* LPAREN  */
    RPAREN = 267,                  /* RPAREN  */
    ARROW = 268,                   /* ARROW  */
    MEAN = 269,                    /* MEAN  */
    MODE = 270,                    /* MODE  */
    MEDIAN = 271,                  /* MEDIAN  */
    GBP = 272,                     /* GBP  */
    YEN = 273,                     /* YEN  */
    DOLLAR = 274,                  /* DOLLAR  */
    EURO = 275,                    /* EURO  */
    GRAMO = 276,                   /* GRAMO  */
    STONE = 277,                   /* STONE  */
    POUND = 278,                   /* POUND  */
    ONZA = 279,                    /* ONZA  */
    LITRO = 280,                   /* LITRO  */
    PINTA = 281,                   /* PINTA  */
    GALLON = 282,                  /* GALLON  */
    BARRIL = 283,                  /* BARRIL  */
    METRO = 284,                   /* METRO  */
    YARDA = 285,                   /* YARDA  */
    PIE = 286,                     /* PIE  */
    MILE = 287,                    /* MILE  */
    MILI = 288,                    /* MILI  */
    DECI = 289,                    /* DECI  */
    CENTI = 290,                   /* CENTI  */
    DECA = 291,                    /* DECA  */
    HECTO = 292,                   /* HECTO  */
    KILO = 293                     /* KILO  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define REAL 258
#define OPE1 259
#define OPE2 260
#define PLUS 261
#define MINUS 262
#define MUL 263
#define DIV 264
#define DELIM 265
#define LPAREN 266
#define RPAREN 267
#define ARROW 268
#define MEAN 269
#define MODE 270
#define MEDIAN 271
#define GBP 272
#define YEN 273
#define DOLLAR 274
#define EURO 275
#define GRAMO 276
#define STONE 277
#define POUND 278
#define ONZA 279
#define LITRO 280
#define PINTA 281
#define GALLON 282
#define BARRIL 283
#define METRO 284
#define YARDA 285
#define PIE 286
#define MILE 287
#define MILI 288
#define DECI 289
#define CENTI 290
#define DECA 291
#define HECTO 292
#define KILO 293

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 80 "converter.y"

    char * valString;
    struct tokens * valToken;
    int valInt;
    float valFloat;

#line 150 "converter.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_CONVERTER_TAB_H_INCLUDED  */
