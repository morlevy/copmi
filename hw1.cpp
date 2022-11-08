#include "tokens.hpp"
#include <cstdio>
#include <string>

static const char* dict[] = {"NOT_GOOD",
                             "VOID",
                             "INT",
                             "BYTE",
                             "B",
                             "BOOL",
                             "AND",
                             "OR",
                             "NOT",
                             "TRUE",
                             "FALSE",
                             "RETURN",
                             "IF",
                             "ELSE",
                             "WHILE",
                             "BREAK",
                             "CONTINUE",
                             "SC",
                             "COMMA",
                             "LPAREN",
                             "RPAREN",
                             "LBRACE",
                             "RBRACE",
                             "ASSIGN",
                             "RELOP",
                             "BINOP",
                             "COMMENT",
                             "ID",
                             "NUM",
                             "STRING"};
int main()
{
    int token;
    while ((token = yylex())) {
        //std::string str{yytext};
        //str.erase(remove_if(str.begin(), str.end(), isspace), str.end());
        //std::printf("%d %s %s\n", yylineno, dict[token], str.c_str());
        std::printf("%d %s %s\n", yylineno, dict[token], yytext);
    }
    return 0;
}
