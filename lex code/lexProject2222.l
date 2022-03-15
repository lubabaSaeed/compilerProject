%{
#include<stdio.h>
%}
WS ([ ]|[\t]|[\n])+
letter [a-zA-Z]
digit [0-9]
Identifier {letter}({letter}|{digit}|[_])*
char [a-zA-Z]
datatype "char"|"int"|"double"|"string"|"float"
STR ["]({char}*[ ]*)*["]
SYM "+"|"-"|"*"|"="|"<"|"<="|">"|">="|"<>"|","|":"|";"|"."|":="|"("|")"|"["|"]"|".."
Comments [{]([ ]*{char}*{digit}*{SYM}*)*[}]
Keyword "if"|"else"|"while"|"do"|"switch"|"case"|"and"|"begin"|"forward"|"div"|"end"|"for"|"function"|"array"|"mod"|"not"|of"|"or"|"procedure"|"program"|"record"|"then"|"to"|"type"|var"|"while"
%%
{WS} {printf(" ");}
{digit}+ {printf("INT");}
{digit}+[.]{digit}+ {printf("double");}
{datatype} {printf("datatype");}
[']{char}['] {printf("char");}
{SYM} {printf("SYM");}
{STR} {printf("STR");}
{Keyword} {printf("Keyword");}
{Identifier} {printf("Identifier");}
{Comments}   ; 
({digit}+|[_])+{Identifier} {printf("invalid_Identifier");}
{digit}*[_]+{digit}*  {printf("invalid");}
.  {printf("ERORR!");}
%%
int yywrap()
{
return 1;
}
main()
{
printf("Enter a string of data\n");
yylex();
}