%{
     #include "a7.1.tab.h"    
%}


%option noyywrap

%%
0 {yylval.num =0;return ZERO;} 
1 {yylval.num =1;return ONE;} 

[\t]+ {}
"\n"           {return EOL;}

. { }

%%
int main()
{
    yylex();
}