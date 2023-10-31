%{
#include<stdio.h>
#include<math.h> 
int i = 0;
%}

DIGIT  [0-9]
NUM    {DIGIT}+(\.{DIGIT}+)?

%%
{NUM} {
        int y = atoi(yytext);
        int i = y %2;
        if (i == 0) {
            fprintf(yyout,"EVEN = %d ",y);
            }
        else {
            fprintf(yyout,"ODD = %d ",y);
            }
            i =0;
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
