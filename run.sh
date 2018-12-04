lex 1307014.l
yacc -vd 1307014.y
gcc lex.yy.c y.tab.c -lm -ll
./a.out 
