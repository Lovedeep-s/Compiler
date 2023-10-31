%{
    
    
 void yyerror(const char *msg);
    
    %}
%union{
    int num;
    char sym;
}

%start N 
%token<num> ZERO ONE
%token DOT 
%type<num> L 
%type<num> N K
%type<num> B

%%
N: L {printf("\n%d", $$);} 
;
K : B DOT L {$$=$1*(1/2)+$1;}

L: L B {$$=$1*(1/2)+$2;} 
| B {$$=$1;} 
;
B:ZERO {$$=$1;} 
|ONE {$$=$1;}
; 
%%
int main(){
    yyparse();
    return 0;
}  

void yyerror(const char *msg) {
   printf("%s", msg);
}