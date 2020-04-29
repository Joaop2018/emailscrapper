
%{
#include <stdio.h>
int tamanho;

%}

/* Definição para encontrar números, letras e caracteres especiais */
ALFANUM   [a-zA-Z0-9] 
ESPECIAL  [.\-\_]

/* Definição para encontrar um email */
EMAIL     {ALFANUM}+({ESPECIAL}+{ALFANUM}+)*[@]{ALFANUM}+({ESPECIAL}+{ALFANUM}+)*

%%
 /* Regra para printar email */
{EMAIL}+ { printf("%s\n", yytext); } 

 /* Regra para printar o email no caso de existir pontuações textuais
 * que não interfiram na composição do email */
{EMAIL}+[.\,] { tamanho = yyleng;
                int i=0;
                while(i<tamanho-1) {
                  printf("%c",yytext[i]);
                  i++;
                  }
                printf("\n");
                }





[[:space:]]+ ;
[[:^space:]]+ ;

%%

int main() {
  yylex();
  return 0;
}
