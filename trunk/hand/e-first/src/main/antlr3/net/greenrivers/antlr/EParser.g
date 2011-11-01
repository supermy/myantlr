parser grammar EParser;

options {
    language = Java;
    output = AST;
    tokenVocab = ELexer;
}

@header {
package net.greenrivers.antlr;
}

program : stat+ 
        ;

stat    : expr NEWLINE
        | ID ASSIGN expr NEWLINE
        | NEWLINE
        ;

expr    : multiExpr ( (PLUS|MINUS) multiExpr )*
        ;
        
multiExpr
        : atom ( TIMES atom )*
        ;
        
atom    : INT
        | ID
        | LPAREN expr RPAREN
        ;
