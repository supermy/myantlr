package net.greenrivers.hibernate.manytomany.core;

import java.util.Set;
import java.util.HashSet;

public class Category {
    private Integer id;
    private String name;
    private Set licenses = new HashSet();
    
    public Category () {}
    
    public void setId (Integer id) {
        this.id = id;
    }
    public Integer getId () {
        return id;
    }
    public void setName (String name) {
        this.name = name;
    }
    public String getName () {
        return name;
    }
    public void setLicenses (Set licenses) {
        this.licenses = licenses;
    }
    public Set getLicenses () {
        return licenses;
    }
}
