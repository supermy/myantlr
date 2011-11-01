parser grammar EParser;

options {
    k = 2;
    language = Java;
    output = AST;
    tokenVocab = ELexer;
    ASTLabelType=CommonTree;
}

@header {
package net.greenrivers.hibernate.antlr;
}

program : stat+    /* (stat { System.out.println($stat.tree == null?"null":$stat.tree.toStringTree()); } )+  */
        ;

stat    : expr NEWLINE                  -> expr
        | ID ASSIGN expr NEWLINE        -> ^(ASSIGN ID expr)
        | SAVE expr NEWLINE             -> ^(SAVE expr)
        | LIST ALL NEWLINE              -> ^(LIST ALL)
        | NEWLINE                       ->
        ;

expr    : multiExpr ( (PLUS^|MINUS^) multiExpr )*
        ;
        
multiExpr
        : atom ( TIMES^ atom )*
        ;
        
atom    : INT
        | ID
        | LPAREN! expr RPAREN!
        ;
