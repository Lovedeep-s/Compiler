%{
    #include<stdio.h>
int sum =0;
int j =0;

%}

%%
[0-9][0-9][0-9][0-9]  {
                while(j<yyleng )
                {
                    sum =sum + yytext[j] -'0';
                    
                    j++;
                }
                if(sum==9)
                {
                    printf(" satisfies");
                    return 0;
                }
                else
                {
                    printf(" does not satisfy");
                    return 0;
                }
            return 0;
        }

%%
int yywrap() {
return 1; // Indicate the end of input
}
int main() {
    printf ("Enter \n" );
    yylex();
    
    return 0;
}
