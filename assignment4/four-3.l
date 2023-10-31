%{
    int i=0,j=1;
    char s[100];
%}
c[a-zA-Z]
vowel[aeiouAEIOU]
cons[^aeiouAEIOU]
%%
{vowel}{c}* {
            strcpy(s,yytext);
            strcat(s,"ay");
            printf("%s ",s);
            return 0;
            }
{cons}{c}* { while(j<yyleng )
                {
                    s[i]=yytext[j];
                    i++;
                    j++;
                }
                
            s[i]=yytext[0];
            strcat(s,"ay");
            printf("%s ",s);
            return 0;
}
c* {
    printf("%s ",yytext);return 0;
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
