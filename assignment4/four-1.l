%{
%}

%%
(.)*(1)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] {printf("done");return 0;}
[0-9]* {printf("not valid"); return 0; }
%%
int yywrap() {
return 1; // Indicate the end of input
}
int main() {
    printf ("Enter \n" );
    yylex();
    
    return 0;
}
