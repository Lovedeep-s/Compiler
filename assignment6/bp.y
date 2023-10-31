%{
    
    
 void yyerror(const char *msg);
    
    %}
%union{
    int num;
    char sym;
}

%start input
%token<num> NUMBER
%token EOL
%token PLUS MINUS TIMES DIVIDE
%token LPAREN RPAREN
%type <num> exp
%type <num> line

%%

input:
    |line input ;
line : exp EOL {printf("%d\n", $1); }
    ;
exp : NUMBER 
| exp PLUS exp {$$ = $1 + $3;}
| exp MINUS exp {$$ = $1 - $3;}
| exp TIMES exp {$$ = $1 * $3;}
| exp DIVIDE exp {$$ = $1 / $3;}
| LPAREN exp RPAREN {$$ = $2;}
;
%%
int main(){
    yyparse();
    return 0;
}  

void yyerror(const char *msg) {
   printf("%s", msg);
}