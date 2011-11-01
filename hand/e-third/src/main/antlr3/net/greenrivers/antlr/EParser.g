parser grammar EParser;

options {
    language = Java;
    output = AST;
    tokenVocab = ELexer;
    ASTLabelType=CommonTree;
}

@header {
package net.greenrivers.antlr;
}

program : stat+    /* (stat { System.out.println($stat.tree == null?"null":$stat.tree.toStringTree()); } )+  */
        ;

stat    : expr NEWLINE                  -> expr
        | ID ASSIGN expr NEWLINE        -> ^(ASSIGN ID expr)
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
