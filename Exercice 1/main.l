%{
#include <stdio.h>
%}
%option noyywrap
entiers [0-9]+
flottants -?[0-9]+\.[0-9]+
identificateurs [a-zA-Z][a-zA-Z0-9]*
keywords int|float|for|while|if|else|return|break|continue;
operateurs \+|\-|\*|\/|\=|\==|\!=|\<|\>|\>=|\<=|\&\&|\|\|
separator \;|\,|\(|\)|\{|\}|\[|\]

%%
{identificateurs} { printf("[ %s ]",yytext ); }
{entiers} { printf("[ %s ]",yytext ); }
{flottants} { printf("[ %s ]",yytext ); }
{keywords} { printf("[ %s ]",yytext ); }
{operateurs} { printf("[ %s ]",yytext ); }
{separator} { printf("[ %s ]",yytext ); }
.|\n;
%%

int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}

