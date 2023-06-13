package com.boots.ws;


public class Greeting {

    private String name;
    private long xPos;
    private long yPos;

    public Greeting() {
    }

    public Greeting(String name,long xPos, long yPos) {
        this.name = name;
        this.xPos = xPos;
        this.yPos = yPos;
    }

    public String getName() {
        return name;
    }
    public long getxPos() {
        return xPos;
    }
    public long getyPos() {
        return yPos;
    }
}