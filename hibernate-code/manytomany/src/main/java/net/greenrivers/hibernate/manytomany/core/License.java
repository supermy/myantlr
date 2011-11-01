package net.greenrivers.hibernate.manytomany.core;

import java.util.Set;
import java.util.HashSet;

public class License {
    private Integer id;
    private String name;
    private Set categories = new HashSet();
    
    public License () {
    }
    
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
    public void setCategories (Set categories) {
        this.categories = categories;
    }
    public Set getCategories () {
        return categories;
    }
}
