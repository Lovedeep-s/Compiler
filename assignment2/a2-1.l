%{
#include<stdio.h>
%}

%option noyywrap
digit [0-9]+
snum [-+]?{digit}

%%
({snum}(\.{digit})) {printf("Float: %s\n", yytext);}
({snum}) {printf("Integer: %s\n", yytext);}

%%
int main()
{
    yylex();
    return 0;
}