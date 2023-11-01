%{
#include <stdio.h>
#include <math.h>
void yyerror(const char *msg);
int i=0;
%}

%union {
    int num;
    double real;
}

%start input
%type<num>line
%token<num> ZERO ONE DOT
%type<num> N
%type<real> F
%token EOL

%%
input:
    | p input 
    ;
p: line {printf("Enter a binary number: ");};
line:
    | N DOT F EOL { printf("solution = %lf\n", $1+($3/pow(2,i)));i=0; }
    ;
N: ZERO { $$ = 0; }
 | ONE { $$ = 1; }
 | N ZERO { $$ = $1 * 2; }
 | N ONE { $$ = $1 * 2 + 1; }
 ;
F: ZERO { $$ = 0;i++; }
 | ONE { $$ = 1;i++; }
    | F ZERO { $$ = $1 * 2; i++;}
    | F ONE { $$ = $1 * 2 + 1; i++; }
 ;
%%

int main() {
    printf("Enter a binary number: ");
    yyparse();
    return 0;
}

void yyerror(const char *msg) {
    printf("%s\n", msg);
}
