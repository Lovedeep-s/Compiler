%{
#include <stdio.h>
%}

DIGIT  [0-9]
NUM    {DIGIT}+(\.{DIGIT}+)?

%%
{NUM} {
    // Check if the number contains the specific digit (7)
    if (strchr(yytext, '7')) {
        printf("Found: %s\n", yytext);
    }
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
    if (!input_file) {
        perror("Error opening the input file");
        return 1;
    }
    
    yyin = input_file;
    yylex();
    
    fclose(input_file);
    
    return 0;
}
