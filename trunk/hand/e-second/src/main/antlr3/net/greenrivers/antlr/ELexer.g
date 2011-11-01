lexer grammar ELexer;

@header {
package net.greenrivers.antlr;
}

MINUS   : '-'
        ;

PLUS    : '+'
        ;

TIMES   : '*'
        ;

ASSIGN  : '='
        ;

LPAREN  : '('
        ;

RPAREN  : ')'
        ;

ID      : ('a'..'z'|'A'..'Z')+
        ;

INT     : ('0'..'9')+
        ;
        
NEWLINE : '\r'?'\n' 
        ;

WS      : (' '|'\t'|'\n'|'\r')+ {$channel=HIDDEN;} 
        ;
