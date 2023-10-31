
%%
[ ]([ ])* { 
fprintf(yyout," ");
}
([ ])*(\n)([ ])* { 
fprintf(yyout," ");
}
%%
int main()
{
// Point yyin to a file with text, this acts as input to
our program
yyin = fopen("text1.txt","r");
// Point yyout to output file.
yyout = fopen("text2.txt","w");
yylex();
return 0;
}