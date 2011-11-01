tree grammar EWalker;

options {
    tokenVocab=ELexer;
    ASTLabelType=CommonTree;
}

@header {
package net.greenrivers.hibernate.antlr;

import java.util.Map;
import java.util.HashMap;
}

@members {
HashMap<String, Integer> memory = new HashMap<String, Integer>();
LogMessageService lmService = (LogMessageService) SpringContextHolder.ctx.getBean( "logMessageService" );
}

prog    :       stat+
        ;

stat    :       expr {
                     System.out.println( $expr.value ); 
                     }
        |       ^(ASSIGN ID expr) { memory.put( $ID.text, new Integer( $expr.value ) ); }
        |       ^(SAVE expr) { 
                             StringBuilder msg = new StringBuilder();
                             msg.append( "From EWalker: " );
                             msg.append( " = " );
                             msg.append( $expr.value );
                             lmService.save( msg.toString() ); 
                             }
        |       ^(LIST ALL) { System.out.println( lmService.list() ); }
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
