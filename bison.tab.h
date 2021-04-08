/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Skeleton interface for Bison GLR parsers in C

   Copyright (C) 2002-2015, 2018-2020 Free Software Foundation, Inc.

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

#ifndef YY_YY_BISON_TAB_H_INCLUDED
# define YY_YY_BISON_TAB_H_INCLUDED
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
    T_PLUS = 258,
    T_MINUS = 259,
    T_TIMES = 260,
    T_SLASH = 261,
    T_MODULO = 262,
    T_LPAREN = 263,
    T_RPAREN = 264,
    T_LBRACE = 265,
    T_RBRACE = 266,
    T_SEMICOLON = 267,
    T_ASSIGN = 268,
    T_EQL = 269,
    T_NEQ = 270,
    T_LSS = 271,
    T_GTR = 272,
    T_LEQ = 273,
    T_GEQ = 274,
    T_BITWISEAND = 275,
    T_BITWISEOR = 276,
    T_BITWISEXOR = 277,
    T_AND = 278,
    T_OR = 279,
    T_LEFTSHIFT = 280,
    T_RIGHTSHIFT = 281,
    T_VARSYM = 282,
    T_FORSYM = 283,
    T_PRINT = 284,
    T_BOOL = 285,
    T_IDENT = 286,
    T_STRING = 287,
    T_INTEGER = 288,
    T_DOUBLE = 289,
    T_UNKNOWN = 290,
    T_SWITCH = 291,
    T_COLON = 292,
    T_BREAK = 293,
    T_CASE = 294,
    T_CHAR = 295,
    T_DFAULT = 296
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{

    char *id;
    char *str;
    int integer;
    double floating;
    int boolean;
    char car;


};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_BISON_TAB_H_INCLUDED  */
