%{
#include "parser-defs.h"
#include "parser.tab.h"

/*
 * You may want to use this string to assemble the lexeme
 * of string constants by adding the current matched character from yytext to it.
 * You can do this as buffer += yytext;
 */
string buffer;


/*
 * You may want to track the comment desting depth with this variable.
 */
int comment_depth = 0;

%}


%option noyywrap

WHITESPACE [ \t\f\r\v]+
NEWLINE [\n]
COMMA [,]
  
 
%x STRING
%x COMMENT 

%%



{WHITESPACE} {
  /* Do nothing */
}

{NEWLINE} {
/* Do nothing, but increment line numbers */
 curr_lineno++;
}

{COMMA} {
  return TOKEN_COMMA;
}


. {
  /* Leave this rule at the end of our lexer to "eat up" all illegal strings */
  SET_LEXEME("Unexpected character in input");
  return TOKEN_ERROR;
}



