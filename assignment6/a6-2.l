%{
     #include "a6-2.tab.h"    
%}


%option noyywrap

%%
0 {return ZERO;} 
1 {return ONE;} 

[\t]+ { }
"\n"           {return EOL;}

. { }

%%
