package net.greenrivers.hibernate.manytomany;

import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import static org.junit.Assert.*;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import java.util.List;
import java.util.Set;
import java.util.Iterator;

import net.greenrivers.hibernate.manytomany.core.Category;
import net.greenrivers.hibernate.manytomany.core.License;
import net.greenrivers.hibernate.manytomany.core.Certified;

public class FunctionTest {
    private static class SpringContextHolder {
        static ApplicationContext ctx =  new ClassPathXmlApplicationContext( "applicationContext.xml" );
    }
    
    @After
    public void tearDown () {
        HibernateTemplate hibernateTemplate = (HibernateTemplate) SpringContextHolder.ctx.getBean( "hibernateTemplate" );

        DetachedCriteria findCertified = DetachedCriteria.forClass(Certified.class);
        findCertified.createAlias( "category", "c" );
        findCertified.createAlias( "license", "l" );
        findCertified.add( Restrictions.eq( "c.name", "Category-1" ) );
        findCertified.add( Restrictions.eq( "l.name", "License-2" ) );
        List certifies = hibernateTemplate.findByCriteria( findCertified );
        Certified cert1 = (Certified) certifies.get(0);
        
        hibernateTemplate.delete( cert1 );

        DetachedCriteria findCategory = DetachedCriteria.forClass(Category.class);
        findCategory.add( Restrictions.eq( "name", "Category-1" ) );
        List categories = hibernateTemplate.findByCriteria( findCategory );
        Category cat1 = (Category) categories.get(0);
        
        hibernateTemplate.delete( cat1 );
        
        DetachedCriteria findLicense = DetachedCriteria.forClass(License.class);
        findLicense.add( Restrictions.eq( "name", "License-2" ) );
        List licenses = hibernateTemplate.findByCriteria( findLicense );
        License lic2 = (License) licenses.get(0);
        
        hibernateTemplate.delete( lic2 );
    }
    
    @Test
    public void testHappy () {
        System.out.println( "===== testHapp" );
        HibernateTemplate hibernateTemplate = (HibernateTemplate) SpringContextHolder.ctx.getBean( "hibernateTemplate" );

        License lic2 = new License();
        lic2.setName( "License-2" );
        
        Category cat1 = new Category();
        cat1.setName( "Category-1" );
        
        Certified certified = new Certified();
        certified.setCategory( cat1 );
        certified.setLicense( lic2 );
        certified.setIsDefault( Boolean.FALSE );
        
        //lic2.getCategories().add( cat1 );
        //cat1.getLicenses().add( lic2 );
        
        hibernateTemplate.save( certified );
    }
    
    @Test
    public void testHappy2 () {
        System.out.println( "===== testHapp2" );
        HibernateTemplate hibernateTemplate = (HibernateTemplate) SpringContextHolder.ctx.getBean( "hibernateTemplate" );

        License lic2 = new License();
        lic2.setName( "License-2" );
        
        hibernateTemplate.save( lic2 );
        
        Category cat1 = new Category();
        cat1.setName( "Category-1" );
        
        hibernateTemplate.save( cat1 );
        
        Certified certified = new Certified();
        certified.setCategory( cat1 );
        certified.setLicense( lic2 );
        certified.setIsDefault( Boolean.FALSE );
        
        //lic2.getCategories().add( cat1 );
        //cat1.getLicenses().add( lic2 );
        
        hibernateTemplate.save( certified );
    }
    
    @Test
    public void testHappy3 () {
        System.out.println( "===== testHapp3" );
        HibernateTemplate hibernateTemplate = (HibernateTemplate) SpringContextHolder.ctx.getBean( "hibernateTemplate" );

        License lic2 = new License();
        lic2.setName( "License-2" );
        
        Category cat1 = new Category();
        cat1.setName( "Category-1" );
        
        Certified certified = new Certified();
        certified.setCategory( cat1 );
        certified.setLicense( lic2 );
        certified.setIsDefault( Boolean.FALSE );
        
        lic2.getCategories().add( cat1 );
        cat1.getLicenses().add( lic2 );
        
        hibernateTemplate.save( certified );
    }
}
