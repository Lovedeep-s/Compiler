
%%
[ ]([ ])* {fprintf(yyout," ");}
([ ])*(\n)([ ])* { fprintf(yyout," ");}

\/\/(.*) {fprintf(yyout," ");}
\/\*(.*\n)*.*\*\/ { fprintf(yyout," ");}



%%
int yywrap() {
return 1; // Indicate the end of input
}
int main()
{

yyin = fopen("txt.c","r");
yyout = fopen("text2.txt","w");
yylex();
return 0;
}