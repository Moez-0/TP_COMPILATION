%{
#include <stdio.h>
%}
%option noyywrap

%%
.*011.*          { printf("Chaine contenant le facteur 011: %s\n", yytext); }
.*00            { printf("Chaine se terminant par 00: %s\n", yytext); }
^1.*10         { printf("Chaine commencant par 1 et se terminant par 10 : %s\n", yytext); }
.|\n             { /* ne rien faire */ }
%%

int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}