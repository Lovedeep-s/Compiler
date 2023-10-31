%{
int n = 0;
%}

%%
"int"|"float"|"double"|"char"|"void"|"short"|"long"|"signed"|"unsigned"|"struct"|"union"|"enum"|"typedef"|"const"|"volatile"|"auto"|"register"|"static"|"extern"|"inline"|"restrict"|"_Bool"|"_Complex"|"_Imaginary" {n++; printf("Keyword\n");}
[a-zA-Z_][a-zA-Z0-9_]* {n++; printf("Identifier\n");}
[0-9]+ {n++; printf("Integer\n");}
[0-9]*\.[0-9]+ {n++; printf("Float\n");}
[0-9]*\.[0-9]+[eE][+-]?[0-9]+ {n++; printf("Float\n");}
[0-9]+[eE][+-]?[0-9]+ {n++; printf("Float\n");}
\"(\\.|[^\\"])*\" {n++; printf("String\n");}
\'(\\.|[^\\'])*\' {n++; printf("Character\n");}
"("|")"|"["|"]"|"{"|"}"|";"|","  {n++; printf("Puncations\n");}
"++"|"+"|"--"|"-"|">="|">"|"<="|"<"|"/"|"*"|"-" {n++; printf("Operator\n");}
%%
int yywrap() {
return 1; // Indicate the end of input
}

int main ()
{
printf ("Enter \n" );
yylex();
return 0;

}