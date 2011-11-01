lexer grammar ELexer;

@header {
package net.greenrivers.hibernate.antlr;
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
        
SAVE    : 'save'
        ;
        
LIST    : 'list'
        ;

ALL     : 'all'
        ;

ID      : ('a'..'z'|'A'..'Z')+
        ;

INT     : ('0'..'9')+
        ;
        
NEWLINE : '\r'?'\n' 
        ;

WS      : (' '|'\t'|'\n'|'\r')+ {$channel=HIDDEN;} 
        ;
