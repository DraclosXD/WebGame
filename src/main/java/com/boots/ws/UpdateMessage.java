package com.boots.ws;
public class UpdateMessage {

    private String name;
    private String key;
    public UpdateMessage() {
    }

    public UpdateMessage(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
    public String getKey() {
        return key;
    }

    public void setName(String name) {
        this.name = name;
    }
}