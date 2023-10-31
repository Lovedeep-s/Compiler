%{
     #include "bp.tab.h"    
%}


%option noyywrap

%%
[0-9]+ { yylval.num =atoi(yytext); return NUMBER; }
"+" { return PLUS; }
"-" { return MINUS; }
"*" { return TIMES; }
"/" { return DIVIDE; }
"(" { return LPAREN; }
")" { return RPAREN; }

[\t]+ {}
"\n"           {return EOL;}

. { }

%%
