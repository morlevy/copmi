%{

/* Declarations section */
#include <stdio.h>
#include "tokens.hpp"

static const int MAX_STR_LEN = 1024;
%}

%option yylineno
%option noyywrap


whitespace		[\t\n\r ]
printable       [\x20-\x7E]|[\t\n\r ]
octal           [0-7]
hexadecimal     [0-9A-F]
three_octal     {octal}{octal}{octal}
two_hex         {hexadecimal}{hexadecimal}
four_hex        {two_hex}{two_hex}
eight_hex       {four_hex}{four_hex}
escape          ([\"nrt0]|(x({hexadecimal}+)))
backslash       [\\]
digits          [0x20-0x7E]
caps_letter     [A-Z]
letters         [a-zA-Z]
merchaot        \"
%%



void                                    return VOID;
int                                     return INT;
byte                                    return BYTE;
[0-9]+b                                 return B;
bool                                    return BOOL;
and                                     return AND;
or                                      return OR;
not                                     return NOT;
true                                    return TRUE;
false                                   return FALSE;
return                                  return RETURN;
if                                      return IF;
else                                    return ELSE;
while                                   return WHILE;
break                                   return BREAK;
continue                                return CONTINUE;
;                                       return SC;
\(                                      return LPAREN;
\)                                      return RPAREN;
\{                                      return LBRACE;
\}                                      return RBRACE;
"=="|"!="|"<"|">"|"<="|">="             return RELOP;
=                                       return ASSIGN;
"+"|"-"|"*"|"/"                         return BINOP;
\/\/{digits}*                           return COMMENT;
[a-zA-Z]([a-zA-Z0-9]*)                  return ID;
([1-9]([0-9]*))|"0"                     return NUM;
\"((printable|(\\{escape}))*)\"         return STRING;
.|"\n"                                  ;



%%

