package net.greenrivers.hibernate.antlr;

import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import static org.junit.Assert.*;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LogMessageServiceTest {
    private static class SpringContextHolder {
        static ApplicationContext ctx =  new ClassPathXmlApplicationContext( "applicationContext.xml" );
    }

    @Test
    public void testHappy () {
        LogMessageService service = (LogMessageService) SpringContextHolder.ctx.getBean( "logMessageService" );
        service.save( "Message from unittest" );
    } // testHappy method
} // LogMessageServiceTest class
