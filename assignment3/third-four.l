%{
#include<stdio.h>
int fivecount = 0;
int i =0;
int j=0;

%}

%%
[0-9]*   { while(i < yyleng-4)
            {
                j=i;
                while(j<i+5 )
                {
                    if(yytext[j] == '5')
                    {
                        fivecount++;
                    } 
                    
                    j++;
                }
                if(fivecount < 2)
                        {
                            printf("not satisfies");
                            return 0;
                        } 
                    fivecount = 0;
                    i++;
            }

            
            printf(" satisfies");
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
