package net.greenrivers.antlr;

import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Main {
    public static void main(String[] args) {
        try {
            // create a CharStream that reads from standard input
            ANTLRInputStream input = new ANTLRInputStream( System.in );
                
            // create a lexer that feeds off of input CharStream
            ELexer lexer = new ELexer( input );
                
            // create a buffer of tokens pulled from the lexer
            CommonTokenStream tokens = new CommonTokenStream( lexer );
                
            // create a parser that feeds off the tokens buffer
            EParser parser = new EParser( tokens );
                
            // begin parsing at rule program
            EParser.program_return result = parser.program();
            
            CommonTree tree = (CommonTree) result.getTree();
            StringBuilder msg = new StringBuilder();
            msg.append( "Default AST tree: " );
            msg.append( tree.toStringTree() );
            System.out.println( msg.toString() );
        } catch (Exception ex) {
            System.err.println("ANTLR demo parser threw exception:");
            ex.printStackTrace();
        }
    }
}
