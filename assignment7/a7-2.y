%{
 void yyerror(const char *msg);
 %}
%union{
    int num;
    char sym;
}

%start input 
%token<num> ZERO ONE
%type<num> L 
%type<num> N 
%type<num> B
%type<num> p
%token EOL
%token DOT

%%
input :
|p input 
;
p : N {printf("Enter Binary number = ");};
N:L DOT L EOL {printf("solution = %d\n", $$);}
|L EOL {printf("solution = %d\n", $$);}
L: L B {$$=$1*2+$2;} 
| B {$$=$1;} 
B:ZERO {$$=$1;} 
|ONE {$$=$1;}; 
; 
%%
int main(){
    printf("Enter a binary number: ");
    yyparse();
    return 0;
}  

void yyerror(const char *msg) {
   printf("%s", msg);
}