/* 
	Name : Tajul Islam;
	Roll : 1307014 
*/


%{
	#include<stdio.h>
	#include<math.h>
    #include<string.h>

	int cnt=1,val,flag_for_switch=0;

	//cnt points index for defined variable 

	typedef struct entry {
    	char *str;
    	int n;
	}store;
	
	store var_index[1000],var_value[1000];

	//var_index contains defined var name and associated index
	//var_value contains defined var name and associated value

	


    void yyerror(char *s){
	    printf( "%s\n", s);
    }


    int yylex();

    int is_declared(char *key);
    int find_value_for_variable(char *key);
    void insert_variable_to_VarList(store *p, char *s, int n);
	void overwrite_existing_var_val (store *p, char *s, int n);

	
%}


%union 
{
        int number;
        char *string;
}

/* BISON Declarations */

%token <number> NUM
%token <string> VAR 
%token <string> IF  ELSE ELIF MAIN INT FLOAT DOUBLE CHAR LP RP LB RB CM SM PLUS MINUS MULT DIV POW ASSIGN FOR COL WHILE BREAK DEFAULT CASE SWITCH inc dec
%type <string> statement
%type <number> expression
%type <number> switch_expression
%nonassoc IFX
%nonassoc ELSE
%left LT GT LE GE
%left PLUS MINUS
%left MULT DIV
%left POW

/* Simple grammar rules */

%%

program: MAIN LP RP LB cstatement RB { printf("\n\n<----------$ Compilation Successful $------------>\n"); }
	 ;

cstatement: /* empty */

	| cstatement statement
	
	| cdeclaration
	;

cdeclaration:	TYPE ID1 SM	{ printf("\nValid declaration\n"); }
   
			;
			
TYPE : INT

     | FLOAT

     | CHAR
     ;

ID1  : ID1 CM VAR	{
						if(is_declared($3))   //if var is already declared
						{
							printf("\tError : %s is already declared\n\n", $3 );
						}
						else
						{
							insert_variable_to_VarList(&var_index[cnt],$3, cnt);
							cnt++;
							
						}
			}

     |VAR	{
				if(is_declared($1))  //if var is already declared
				{
					printf("\tError : %s is already declared\n\n", $1 );
				}
				else
				{
					insert_variable_to_VarList(&var_index[cnt],$1, cnt);
							cnt++;
				}
			}
     ;

statement: SM
	|  SWITCH LP switch_expression RP LB BASE RB    {printf("</> SWITCH case completed.\n");val=$3;} 

	| expression SM 			{ printf("\nvalue of expression: %d\n", ($1)); }

    | VAR ASSIGN expression SM 		{
							if(is_declared($1)){
								int i = find_value_for_variable($1);
								if (!i){
									insert_variable_to_VarList(&var_value[cnt], $1, $3);
									cnt++;
								}
								var_value[i].n = $3;
								printf("\n(%s) Value of the variable: %d\t\n",$1,$3);
							}
							else {
								printf("\n\tError : %s not declared yet\n\n",$1);
							}
							
						}

	| IF LP expression RP LB expression SM RB %prec IFX {
								if($3)
								{
									printf("\n</> Value of expression in IF: %d\n",($6));
								}
								else
								{
									printf("\n</> Condition value zero in IF block\n");
								}
							}

	| IF LP expression RP LB expression SM RB ELSE LB expression SM RB {
								 	if($3)
									{
										printf("\n</> Value of expression in IF: %d\n",$6);
									}
									else
									{
										printf("\n</> Value of expression in ELSE: %d\n",$11);
									}
								   }
	| IF LP expression RP LB IF LP expression RP LB expression SM RB ELSE LB expression SM RB expression SM RB ELSE LB expression SM RB %prec IFX {
								 	if($3)
									{
										if($8)
											printf("\nvalue of expression middle IF: %d\n",$11);
										else
											printf("\nvalue of expression middle ELSE: %d\n",$16);
										printf("\nvalue of expression in first IF: %d\n",$19);
									}
									else
									{
										printf("\nvalue of expression in else: %d\n",$24);
									}
								   }
	| IF LP expression RP LB expression SM RB ELIF LP expression RP LB expression SM RB ELSE LB expression SM RB {
								 	if($3)
									{
										printf("\nvalue of expression in IF: %d\n",$6);
									}
									else if($11)
									{
										printf("\nvalue of expression in ELIF: %d\n",$14);
									}
									else
									{
										printf("\nvalue of expression in ELSE: %d\n",$19);
									}
								   }	

						   
	| FOR LP NUM COL NUM RP LB expression RB     {
	   int i=0;
	   for(i=$3;i<$5;i++){

	   printf("\n </> for loop statement\n");
	   }
	}
	| WHILE LP NUM GT NUM RP LB expression RB   {
										int i;
										printf("\n </> While LOOP: ");
										for(i=$3;i<=$5;i++)
										{
											printf("%d ",i);
										}
										printf("\n");
										printf("\tValue of the expression: %d\n",$8);

	}
	;
///////////////////////
	
			BASE : Bas   
				 | Bas Dflt 
				 ;

			Bas   : /*NULL*/
				 | Bas Cs     
				 ;

			Cs    : CASE NUM COL expression SM   {
						if(val==$2){
							  flag_for_switch=1;
							  printf("\nCase No : %d  and Result :  %d\n",$2,$4);
						}
					}
				 ;

			Dflt    : DEFAULT COL NUM SM    {
						if(flag_for_switch==0){
							printf("\nResult in default Value is :  %d \n",$3);
						}
					}
				 ;    
	/////////////////////////////



	
	
expression: NUM				{ $$ = $1; 	}

	| VAR				{ $$ = find_value_for_variable($1); printf("Variable value: %d",$$);}

	| expression PLUS expression	{ $$ = $1 + $3; }

	| expression MINUS expression	{ $$ = $1 - $3; }

	| expression MULT expression	{ $$ = $1 * $3; }

	| expression DIV expression	{ 	if($3) 
				  		{
				     			$$ = $1 / $3;
				  		}
				  		else
				  		{
							$$ = 0;
							printf("\n\tError : Division by zero\t");
				  		} 	
				    	}
	| expression POW expression { 
									$$ = pow($1,$3); 
									printf("\n%d power %d = %d\n",$1,$3,$$);

								}


	| expression LT expression	{ $$ = $1 < $3; }

	| expression GT expression	{ $$ = $1 > $3; }

	| expression GE expression	{ $$ = $1 >= $3; }
	
	| expression LE expression	{ $$ = $1 <= $3; }

	| LP expression RP		{ $$ = $2;	}
	
	| inc expression inc         { $$=$2+1; printf("\nIncremented Value : %d\n",$$);}
	| dec expression dec         { $$=$2-1; printf("\nDecremented Value : %d\n",$$);}
	;

	////////////////////////////////////

	switch_expression: NUM				{ $$ = $1; val = $$;	}

	| VAR				{ $$ = find_value_for_variable($1); val = $$;}

	| switch_expression PLUS switch_expression	{ $$ = $1 + $3; val = $$; }

	| switch_expression MINUS switch_expression	{ $$ = $1 - $3; val = $$; }

	| switch_expression MULT switch_expression	{ $$ = $1 * $3;  val = $$;}

	| switch_expression DIV switch_expression	{ 	if($3) 
				  		{
				     			$$ = $1 / $3; val = $$;
				  		}
				  		else
				  		{
							$$ = 0;
							 val = $$;
				  		} 	
				    	}
	| switch_expression POW switch_expression { $$ = pow($1,$3);  val = $$;}

	
	;

	///////////////////////////////////


%%
//////////////////////////
void insert_variable_to_VarList(store *p, char *s, int n)
{
  p->str = s;
  p->n = n;
}

int is_declared(char *key) //returns index of the var 'key' if true
{							//else returns 0
    int i = 1;
    char *name = var_index[i].str;
    while (name) {
        if (strcmp(name, key) == 0)
            return var_index[i].n;  //returns index of variable
        name = var_index[++i].str;
    }
    return 0;
}
/////////////////////////
void overwrite_existing_var_val (store *p, char *s, int n)
{
  p->str = s;
  p->n = n;
  
}

int find_value_for_variable(char *key)
{
    int i = 1;
    char *name = var_value[i].str;
    while (name) {
        if (strcmp(name, key) == 0)
            return i;
        name = var_value[++i].str;
    }
    return 0;
}

///////////////////////////


int yywrap()
{
	return 1;
}

