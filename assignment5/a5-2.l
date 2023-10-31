%{
#include<stdio.h>
#include<math.h> 
int i = 0;
int sum =0;
%}

DIGIT  [0-9]
NUM    {DIGIT}+(\.{DIGIT}+)?

%%
{NUM} {
    if (!strchr(yytext, '2')&&!strchr(yytext, '3')&&!strchr(yytext, '4')&&!strchr(yytext, '5')&&!strchr(yytext, '6')&&!strchr(yytext, '7')&&!strchr(yytext, '8')&&!strchr(yytext, '9')) {
        
        i =yyleng-1;

     while (i >= 0 ) {
        if (yytext[i] == '1') {
            int s =1;
             for (int j = i+1; j <yyleng ; j++) {
                s = s*2;
                }
                sum =sum + s;
            }
            i--;
    }
    // string s = to_string(sum);
    // fprintf(yyout, "%s", s.c_str()); 
    fprintf(yyout,"sum = %d ",sum);
    fprintf(yyout,"Found: %s\n", yytext);
    sum =0;
    i=0;
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
