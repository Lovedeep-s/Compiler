%{
     #include "a7-2.tab.h"    
%}


%option noyywrap

%%
0 {yylval.num =0;return ZERO;} 
1 {yylval.num =1;return ONE;} 
[\.] {return DOT;}
[\t]+ {}
"\n"           {return EOL;}

. { }

%%
