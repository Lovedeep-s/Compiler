%{
    
    
 void yyerror(const char *msg);
    
    %}
%union{
    int num;
    char sym;
}

%start input
%token ZERO ONE
%type<num> exp

%token EOL


%%

input:
    |line input ;
line : exp EOL {printf("%d\n", $1); }
    ;
exp : ZERO { $$ = 1; }
    | ONE { $$ = 1; }
    | exp exp { $$ = $1 + $2; }
    | exp ZERO { $$ = $1 + 1;  }
    | exp ONE { $$ = $1 + 1; }
    ;
;
%%
int main(){
    yyparse();
    return 0;
}  

void yyerror(const char *msg) {
   printf("%s", msg);
}