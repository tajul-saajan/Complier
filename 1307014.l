/* 
	Name : Tajul Islam;
	Roll : 1307014 
*/

%{
	#include<stdio.h>
	#include <string.h>
	#include "y.tab.h"
	#include<stdlib.h>
	int yylineno;
%}

identifiers "tajul_"[a-zA-Z]([a-zA-Z0-9])*

Single_line_comment [/][/].*
Multi_line_comment [ ]*[/][c][/][a-zA-Z0-9!@#*(){}_+-,.:\|?><\n\t ]*[/][c][/]

/*RE and Action*/

%%


{Single_line_comment} {
	printf("\n---- Single line comment ---- \n\n");

}
{Multi_line_comment} {
	printf("\n---- Multi line comment ---- \n\n");
}

"pp"   {return inc;}
"mm"   {return dec;}
"LB"	 { return LB; }
"RB"	  { return RB; }
"BREAK"    {   return BREAK;     }
"kase"      { return CASE;      }
"Suitch"      { return SWITCH;	}
"def"     {  return DEFAULT; 	}
"while_loop" { return WHILE;}
"int_a"	{ return INT; }
"float_a"	{ return FLOAT; }
"char_a"	{ return CHAR; }

[:]     { return COL;}
[0-9]+	{ 
		yylval.number = atoi(yytext);
		return NUM;
	}
"for_loop"   { return FOR;}	
"LP"	{ return LP; }
"RP"	{ return RP; }
"CM"	{ return CM; }
"#"	{ return SM; }
"add"	{ return PLUS;}
"sub"	{ return MINUS; }
"mul"	{ return MULT; }
"div"	{ return DIV; }
"exp"	{ return POW; }
"eq"		{ return ASSIGN;  }
"gt"	{ return GT; }
"lt"	{ return LT; }
"le"	{ return LE; }
"ge"	{ return GE; }


{identifiers} {
	 yylval.string=strdup(yytext);
	 return VAR;
	}

"JODI"		{ return IF;}
"OTHOBA"		{ return ELSE;}
"NOYTO"		{ return ELIF;}

"main_func"	{ return MAIN; }



[ \t\n]*



.	{
		printf("\n\tError : Undefined Character(s) at line no %d\n",yylineno);
	}
%%

/* user subroutines */

int main()
{
	yyin = freopen("input.txt","r",stdin);
	yyout = freopen("output.txt","w",stdout);
	yyparse();
	
}
