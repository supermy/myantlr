package net.greenrivers.hibernate.antlr;

import net.greenrivers.hibernate.antlr.core.LogMessage;
import org.springframework.orm.hibernate3.HibernateTemplate;

import java.util.List;
import java.util.Iterator;

public class LogMessageService {
    private HibernateTemplate hibernateTemplate;
    
    public void setHibernateTemplate (HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }
    
    public LogMessageService () {
    }
    
    public void save (String message) {
        LogMessage msg = new LogMessage();
        msg.setContent( message );
        
        hibernateTemplate.save( msg );
    } // save()
    
    public String list () {
        StringBuilder sb = new StringBuilder();
        
        sb.append( "Listing LogMessage content from db [\n" );
        
        List ret = hibernateTemplate.find( "from LogMessage ", null );
        Iterator iter = ret.iterator();
        while( iter.hasNext() ) {
            LogMessage lm = (LogMessage) iter.next();
            sb.append( lm.getContent() ).append( "\n" );
        } // while
        sb.append( "]" );
        
        return sb.toString();
    } // list()
} // LogMessageService class
