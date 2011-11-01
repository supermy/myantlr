package net.greenrivers.hibernate.antlr.core;

public class LogMessage {
    private Integer id;
    private String content;
    
    public LogMessage () {
    } // Constructor
    
    public void setId (Integer id) {
        this.id = id;
    }
    public Integer getId () {
        return id;
    }
    
    public void setContent (String content) {
        this.content = content;
    }
    public String getContent () {
        return content;
    }
} // LogMessage Class
