%{
#include <stdio.h>
int nbOps;
int nbErrors;
%}

%option noyywrap

%%
[+-/*] { printf("Ceci est un operateur! %s \n", yytext); nbOps++; }
F+ { printf("Suite de F = (%s) \n", yytext); }
^(.*ab){2}[^ab]*$ { printf("deux ab au plus = (%s) \n", yytext); }
^[a-z]{1}[a-z]{1}[a-z]{1}$  { printf("Mot de longeur 3 = (%s) \n", yytext); }
^[A-Z]{1}[A-Z]{1}[A-Z]{1}$ { printf("Mot de longeur 3 = (%s) \n", yytext); }
^[0-9]{1}[0-9]{1}[0-9]{1}$ { printf("Mot de longeur 3 = (%s) \n", yytext); }
-?[0-9]+\.[0-9]+ { printf("Nombre reel = (%s) \n", yytext); }

.|\n { printf("Erreur !\n"); nbErrors++; }
%%

int main(int argc, char *argv[]) {
    nbOps = 0;
    nbErrors = 0;
    yyin = fopen(argv[1], "r");
    if(yyin == NULL) {
        perror("Error opening file");
        return 1;
    }
    yylex();
    fclose(yyin);
    printf("Nombre des operateurs trouves : %d \n", nbOps);
    printf("Nombre des erreurs trouves : %d \n", nbErrors);
    return 0;
}
