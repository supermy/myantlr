package net.greenrivers.hibernate.antlr;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringContextHolder {
    public static final ApplicationContext ctx =  new ClassPathXmlApplicationContext( "applicationContext.xml" );
} // SpringContextHolder class
