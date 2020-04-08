
%{
#include <stdio.h>
int tamanho;

%}

ALFANUM   [a-zA-Z0-9]
ESPECIAL  [.\-\_]

EMAIL     {ALFANUM}+({ESPECIAL}+{ALFANUM}+)*[@]{ALFANUM}+({ESPECIAL}+{ALFANUM}+)*

%%

{EMAIL}+ { printf("%s\n", yytext); }

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
