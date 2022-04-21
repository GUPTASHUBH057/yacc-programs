%{

#include<stdlib.h>
#include<stdio.h>
int yylex(void);
void yyerror(char *);
int lines = 1;
int count = 0;
%}

%token A B

%%

expr:  expr S '\n'  {printf("at line no. %d\n",lines);count++;lines++;}
       | expr S '\t' {printf("at line no. %d\n",lines);count++;}
 	| expr S ' ' {printf("at line no. %d\n",lines);count++;}
 	| error '\n' { yyerrok;  lines++;                }
 	| error '\t' { yyerrok;               }
 	| error ' ' { yyerrok;               }
 	|
       ;
S: A A S B		
    |	A A B
    ;

%%

void yyerror(char *s){

	fprintf(stderr, "%s\n", s);

}

int main(void){

extern FILE *yyin, *yyout;

yyin = fopen("input.txt","r");

yyparse();

printf("\n total count is : %d\n",count);

return 0;

}
