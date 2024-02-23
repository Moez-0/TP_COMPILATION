%{
#include <stdio.h>
%}
%option noyywrap

%%
[a-z]*er { printf("%s : verbe du 1ere groupe de longeur %d\n",yytext,yyleng); }
[a-z]*ir { printf("%s : verbe du 2eme groupe de longeur %d\n",yytext,yyleng); }
.|\n;
%%

int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}

