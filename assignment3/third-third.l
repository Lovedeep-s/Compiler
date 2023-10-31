%{
int digit_count = 0;
int five_count = 0;
%}
digit [0-9]*
%%
[0-9]*(00) {printf("accepted - ending with 00 \n");}
[0-9]*(222)[0-9]* {printf("accepted - consective 222 \n");}
end {printf("end of input.\n"); return 0;}
.*    printf("String does not satisfy the condition.\n");

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