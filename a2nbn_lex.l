/*

To run the program:
1. lex prog.l
2. yacc -d prog.y ( -d creates y.tab.h file )
3. gcc lex.yy.x y.tab.c -ll ( -ll will create a.out )
4 ./a.out

*/


%{

#include<stdio.h>
#include "y.tab.h"

%}

%%

[aA]	{return A;}

[bB]	{return B;}

[\n]	{return *yytext;}

[ \t]	{return *yytext;}	

.	{/* yyerror ("invalid character"); */}

%%

int yywrap(void){
	return 1;
}
