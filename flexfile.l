%{
#include <stdio.h>
#include <string.h>

#include "bison.tab.h"
#define COLOR_RED fprintf(stderr, "\033[1;31m");
#define COLOR_RESET fprintf(stderr, "\033[0m");

int yyerror(const char *s);
%}

%option yylineno

digit         [0-9]
letter        [a-zA-Z]

%%
"//".*               {                        }
"+"                  { return (T_PLUS);       }
"-"                  { return (T_MINUS);      }
"*"                  { return (T_TIMES);      }
"/"                  { return (T_SLASH);      }
"%"                  { return (T_MODULO);     }
"("                  { return (T_LPAREN);     }
")"                  { return (T_RPAREN);     }
"{"                  { return (T_LBRACE);     }
"}"                  { return (T_RBRACE);     }
";"                  { return (T_SEMICOLON);  }
"="                  { return (T_ASSIGN);     }
"=="                 { return (T_EQL);        }
"!="                 { return (T_NEQ);        }
"<"                  { return (T_LSS);        }
">"                  { return (T_GTR);        }
"<="                 { return (T_LEQ);        }
">="                 { return (T_GEQ);        }
"&"                  { return (T_BITWISEAND); }
"|"                  { return (T_BITWISEOR);  }
"^"                  { return (T_BITWISEXOR); }
"&&"                 { return (T_AND);        }
"||"                 { return (T_OR);         }
"<<"                 { return (T_LEFTSHIFT);  }
">>"                 { return (T_RIGHTSHIFT); }
"var"                { return (T_VARSYM);     }
"for"                { return (T_FORSYM);     }
"console.log"        { return (T_PRINT);      }
"switch"    { return (T_SWITCH); }
"case"      {return (T_CASE) ;}
":"     {return (T_COLON); }
"break" { return (T_BREAK) ; }
"default" { return (T_DFAULT); }

"true"               {
                       yylval.boolean = 1;
                       return (T_BOOL);
                     }

"false"              {
                       yylval.boolean = 0;
                       return (T_BOOL);
                     }

{letter}({letter}|{digit})* {
                       if (strlen(yytext) > 15) {
                         COLOR_RED
                         fprintf(stderr, "Identifier \"%s\" length greater than 15characters\n", yytext);
                         COLOR_RESET
                         exit(1);
                       }
                       yylval.id = strdup(yytext);
                       return (T_IDENT);
                     }

\".*\"               {
                       yylval.str = strdup(yytext);
                       return (T_STRING);
                     }

\'.\'                   {
                            yylval.car= yytext[0] ;
                            return (T_CHAR);
                         }
[-+]?{digit}+       {
                       yylval.integer = atoi(yytext);
                       return (T_INTEGER);
                     }

[-+]?{digit}+(\.{digit}+)?([Ee][-+]?{digit}+)? {
                       yylval.floating = atof(yytext);
                       return (T_DOUBLE);
                     }

[ \t\n\r]            /* skip whitespace */
.                    {
                       COLOR_RED
                       if (yytext[0] == '"') {
                         fprintf(stderr, "Unterminated string at %d\n", yylineno);
                       } else {
                         fprintf(stderr, "Invalid character [%c] encountered\n", yytext[0]);
                       }
                       COLOR_RESET
                       return (T_UNKNOWN);
                     }
%%

int yyerror(const char *str)
{
    COLOR_RED
    fprintf(stderr, "Error at Line: %d\n%s\n", yylineno, str);
    COLOR_RESET
    return 0;
}