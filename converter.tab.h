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
    LPAREN = 265,                  /* LPAREN  */
    RPAREN = 266,                  /* RPAREN  */
    ARROW = 267,                   /* ARROW  */
    GBP = 268,                     /* GBP  */
    YEN = 269,                     /* YEN  */
    DOLLAR = 270,                  /* DOLLAR  */
    EURO = 271,                    /* EURO  */
    GRAMO = 272,                   /* GRAMO  */
    STONE = 273,                   /* STONE  */
    POUND = 274,                   /* POUND  */
    ONZA = 275,                    /* ONZA  */
    LITRO = 276,                   /* LITRO  */
    PINTA = 277,                   /* PINTA  */
    GALLON = 278,                  /* GALLON  */
    BARRIL = 279,                  /* BARRIL  */
    METRO = 280,                   /* METRO  */
    YARDA = 281,                   /* YARDA  */
    PIE = 282,                     /* PIE  */
    MILE = 283,                    /* MILE  */
    MILI = 284,                    /* MILI  */
    DECI = 285,                    /* DECI  */
    CENTI = 286,                   /* CENTI  */
    DECA = 287,                    /* DECA  */
    HECTO = 288,                   /* HECTO  */
    KILO = 289                     /* KILO  */
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
#define LPAREN 265
#define RPAREN 266
#define ARROW 267
#define GBP 268
#define YEN 269
#define DOLLAR 270
#define EURO 271
#define GRAMO 272
#define STONE 273
#define POUND 274
#define ONZA 275
#define LITRO 276
#define PINTA 277
#define GALLON 278
#define BARRIL 279
#define METRO 280
#define YARDA 281
#define PIE 282
#define MILE 283
#define MILI 284
#define DECI 285
#define CENTI 286
#define DECA 287
#define HECTO 288
#define KILO 289

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 80 "converter.y"

    char * valString;
    struct tokens * valToken;
    int valInt;
    float valFloat;

#line 142 "converter.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_CONVERTER_TAB_H_INCLUDED  */
