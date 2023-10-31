%{
#include<stdio.h>
#include<math.h> 
int i = 0;
%}

DIGIT  [0-9]
NUM    {DIGIT}+(\.{DIGIT}+)?

%%
{NUM} {
        
        i =0;

     while (i <yyleng-1 ) {
        if(i==0)
        {
            i++;
            continue;
        }
        if (yytext[i-1]>yytext[i]) {
            break;
            }
            i++;
    }
    if(i==yyleng-1)
    {
        
    fprintf(yyout,"Found: %s\n", yytext);
    }
    else
    {
        fprintf(yyout,"Not Found: %s\n", yytext);
    }
    i=0;
    }

.|\n   ; // Ignore all other characters

%%
int yywrap() {
    return 1;
}
int main() {
    // if (argc != 2) {
    //     printf("Usage: %s input_file\n", argv[0]);
    //     return 1;
    // }
    
    FILE* input_file = fopen("t.txt", "r");
    FILE* output_file = fopen("tr.txt", "w");
    
    if (!input_file) {
        perror("Error opening the input file");
        return 1;
    }
    
    yyin = input_file;
    yyout = output_file;
    yylex();
    fclose(output_file);
    fclose(input_file);
    
    return 0;
}
