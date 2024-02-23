%{
#include <stdio.h>
%}
%option noyywrap

%%
[A-Z][a-zA-Z]*   { printf("Mot commencant par une majuscule: %s\n", yytext); }
[a-zA-Z]*er    { printf("Mot se terminant par er: %s\n", yytext); }
j[a-zA-Z]*r   { printf("Mot commencant par j et se terminant par r\": %s\n", yytext); }
.|\n             { /* ne rien faire */ }
%%

int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}