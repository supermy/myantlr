tree grammar EWalker;

options {
    tokenVocab=ELexer;
    ASTLabelType=CommonTree;
}

@header {
package net.greenrivers.antlr;

import java.util.Map;
import java.util.HashMap;
}

@members {
HashMap<String, Integer> memory = new HashMap<String, Integer>();
}

prog    :       stat+
        ;

stat    :       expr { System.out.println( $expr.value ); }
        |       ^(ASSIGN ID expr) { memory.put( $ID.text, new Integer( $expr.value ) ); }
        ;

expr returns [int value]
        :       ^(PLUS a=expr b=expr) { $value = a+b; }
        |       ^(MINUS a=expr b=expr) { $value = a-b; }
        |       ^(TIMES a=expr b=expr) { $value = a*b; }
        |       ID
                {
                Integer v = (Integer) memory.get( $ID.text );
                if( v != null ) {
                    $value = v.intValue();
                } else {
                    System.err.println( "undefined variable " + $ID.text );
                }
                }
        |       INT { $value = Integer.parseInt( $INT.text ); }
        ;
