package net.greenrivers.hibernate.manytomany.core;

public class Certified {
    private Integer id;
    private Category category;
    private License license;
    private Boolean isDefault = Boolean.FALSE;
    
    public Certified () {}
    
    public void setId (Integer id) {
        this.id = id;
    }
    public Integer getId () {
        return id;
    }
    public void setCategory (Category category) {
        this.category = category;
    }
    public Category getCategory () {
        return category;
    }
    public void setLicense (License license) {
        this.license = license;
    }
    public License getLicense () {
        return license;
    }
    public void setIsDefault (Boolean isDefault) {
        this.isDefault = isDefault;
    }
    public Boolean getIsDefault () {
        return isDefault;
    }
}
