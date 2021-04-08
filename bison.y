%{
#include <stdio.h>

int yylex();

%}


%token T_PLUS T_MINUS T_TIMES T_SLASH T_MODULO T_LPAREN T_RPAREN T_LBRACE T_RBRACE T_SEMICOLON T_ASSIGN T_EQL T_NEQ T_LSS T_GTR T_LEQ T_GEQ T_BITWISEAND T_BITWISEOR T_BITWISEXOR T_AND T_OR T_LEFTSHIFT T_RIGHTSHIFT T_VARSYM T_FORSYM T_PRINT T_BOOL T_IDENT T_STRING T_INTEGER T_DOUBLE T_UNKNOWN T_SWITCH T_COLON T_BREAK T_CASE T_CHAR T_DFAULT

// # order of evaluation (left to right)
%left T_PLUS T_MINUS T_TIMES T_SLASH T_MODULO T_EQL T_NEQ T_LSS T_GTR T_LEQ T_GEQ T_BITWISEAND T_BITWISEOR T_BITWISEXOR T_AND T_OR T_LEFTSHIFT T_RIGHTSHIFT


%type <id> T_IDENT
%type <number> T_INTEGER
%type <boolean> T_BOOL
%type <str> T_STRING
%type <floating> T_DOUBLE
%type <car> T_CHAR

%locations
//%error-verbose
%define parse.error verbose

%union{
    char *id;
    char *str;
    int integer;
    double floating;
    int boolean;
    char car;
}

%glr-parser

%%

prog:
  %empty
| stmt prog
;

stmt:
  switch
| decl T_SEMICOLON
| init_expr T_SEMICOLON
| update_expr T_SEMICOLON
| fn_exp T_SEMICOLON
| T_BREAK T_SEMICOLON
;


switch:
    T_SWITCH T_LPAREN expr T_RPAREN T_LBRACE case_list default_opr case_list T_RBRACE
;

default_opr:
    T_DFAULT T_COLON case_body 
;

case_list:
    %empty 
    |   one_case case_list
;

one_case:
    T_CASE const_value T_COLON case_body
;

case_body:
    T_LBRACE prog T_RBRACE 
    |   prog
;

const_value:
    T_INTEGER
    |   T_CHAR
;


init_expr:
  T_VARSYM update_expr
;

update_expr:
  T_IDENT T_ASSIGN expr
;

decl:
  T_VARSYM T_IDENT
;

fn_exp:
  T_PRINT T_LPAREN args T_RPAREN
;

args:
  value
| %empty
;

value:
  T_IDENT
| literal
;

literal:
  T_INTEGER
| T_BOOL
| T_DOUBLE
| T_STRING

expr:
  t expr_
;

expr_:
  T_OR expr
| %empty
;

t:
  f t_
;

t_:
  T_AND t
| %empty
;

f:
  g f_
;

f_:
  T_BITWISEOR f
| %empty
;

g:
  h g_
;

g_:
  T_BITWISEXOR g
| %empty
;

h:
  i h_
;

h_:
  T_BITWISEAND h
| %empty
;

i:
  j i_
;

i_:
  equality_op i
| %empty
;

j:
  k j_
;

j_:
  rel_op j
| %empty
;

k:
  l k_
;

k_:
  bitwise_op k
| %empty
;

l:
  m l_
;

l_:
  basic_arth_op l
| %empty
;

m:
  n m_
;

m_:
  complex_arth_op m
| %empty
;

n:
  value
| T_LPAREN expr T_RPAREN
;

complex_arth_op:
  T_TIMES
| T_SLASH
| T_MODULO
;

basic_arth_op:
  T_PLUS
| T_MINUS
;

bitwise_op:
  T_LEFTSHIFT
| T_RIGHTSHIFT
;

rel_op:
  T_LSS
| T_GTR
| T_LEQ
| T_GEQ
;

equality_op:
  T_EQL
| T_NEQ
;


%%

int main()
{
    yyparse();
    return 0;
}