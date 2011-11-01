parser grammar EParser;

options {
    language = Java;
    output = AST;
    tokenVocab = ELexer;
}

@header {
package net.greenrivers.antlr;

import java.util.Map;
import java.util.HashMap;
}

@members {
    HashMap<String, Integer> memory = new HashMap<String, Integer>();
}

program : stat+ 
        ;

stat    : expr NEWLINE { System.out.println( $expr.value ); }
        | ID ASSIGN expr NEWLINE { memory.put( $ID.text, new Integer( $expr.value ) ); }
        | NEWLINE
        ;

expr returns [int value]
        : e=multiExpr { $value = $e.value; } 
          ( PLUS e=multiExpr { $value += $e.value; }
          | MINUS e=multiExpr { $value -= $e.value; }
          )*
        ;
        
multiExpr returns [int value]
        : e=atom { $value = $e.value; } ( TIMES e=atom { $value *= $e.value; } )*
        ;
        
atom returns [int value]
        : INT { $value = Integer.parseInt( $INT.text ); }
        | ID 
          {
          Integer v = (Integer) memory.get( $ID.text );
          if( v!= null ) {
              $value = v.intValue();
          } else {
              System.err.println( "undefined variable " + $ID.text );
          }
          }
        | LPAREN expr RPAREN { $value = $expr.value; }
        ;
