package com.boots.ws;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ScheduledUpdatesOnTopic{

    @Autowired
    private SimpMessagingTemplate template;
    private HelloMessage helloMessage = new HelloMessage("super");
    private int tick = 0;
    @Scheduled(fixedDelay=300)
    public void publishUpdates(){
        tick+=1;
        String str = helloMessage.getName() + Integer.toString(tick);
        helloMessage.setName(str);
        template.convertAndSend("/topic/greetings", helloMessage);
    }
}