/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    NUM = 258,
    VAR = 259,
    IF = 260,
    ELSE = 261,
    ELIF = 262,
    MAIN = 263,
    INT = 264,
    FLOAT = 265,
    DOUBLE = 266,
    CHAR = 267,
    LP = 268,
    RP = 269,
    LB = 270,
    RB = 271,
    CM = 272,
    SM = 273,
    PLUS = 274,
    MINUS = 275,
    MULT = 276,
    DIV = 277,
    POW = 278,
    ASSIGN = 279,
    FOR = 280,
    COL = 281,
    WHILE = 282,
    BREAK = 283,
    DEFAULT = 284,
    CASE = 285,
    SWITCH = 286,
    inc = 287,
    dec = 288,
    IFX = 289,
    LT = 290,
    GT = 291,
    LE = 292,
    GE = 293
  };
#endif
/* Tokens.  */
#define NUM 258
#define VAR 259
#define IF 260
#define ELSE 261
#define ELIF 262
#define MAIN 263
#define INT 264
#define FLOAT 265
#define DOUBLE 266
#define CHAR 267
#define LP 268
#define RP 269
#define LB 270
#define RB 271
#define CM 272
#define SM 273
#define PLUS 274
#define MINUS 275
#define MULT 276
#define DIV 277
#define POW 278
#define ASSIGN 279
#define FOR 280
#define COL 281
#define WHILE 282
#define BREAK 283
#define DEFAULT 284
#define CASE 285
#define SWITCH 286
#define inc 287
#define dec 288
#define IFX 289
#define LT 290
#define GT 291
#define LE 292
#define GE 293

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 46 "1307014.y" /* yacc.c:1909  */

        int number;
        char *string;

#line 135 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
