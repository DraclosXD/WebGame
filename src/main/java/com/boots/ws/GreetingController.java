package com.boots.ws;

import com.boots.entity.Gamer;
import com.boots.entity.User;
import com.boots.repository.UserRepository;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

@Controller
public class GreetingController {
   // @Autowired
    //private UserService userService;

    //@Autowired
    //private UserRepository userRepository;
/*
    @MessageMapping("/hello")
    @SendTo("/queue/greetings")
    public Greeting greeting(HelloMessage message) throws Exception {
        System.out.println("ВЫВОД!");
        Thread.sleep(1000); // simulated delay
        return new Greeting("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
    }*/

    @MessageMapping("/hello")
    @SendTo("/queue/greetings")
    public Greeting greeting(HelloMessage message) throws Exception {
        //UserService userService = new UserService();
        //UserRepository userRepository ;
        System.out.println("ВЫВОД!");
        long xPos = (long)(800*Math.random());
        long yPos = (long)(500*Math.random());
        /*long uId = 8;
        User u = userService.findUserById(uId);
        Gamer g = new Gamer(u.getId(),xPos,yPos,u);
        userService.saveGamer(g);*/
         return new Greeting(HtmlUtils.htmlEscape(message.getName()), xPos,yPos);
//

    }

    @MessageMapping("/update")
    @SendTo("/queue/greetings")
    public Greeting greetingUpdate(UpdateMessage message) throws Exception {
        return new Greeting(HtmlUtils.htmlEscape(message.getName()), ((long) (1000 * Math.random())), (long) (800 * Math.random()));
//        return new Greeting("Hello, "  + HtmlUtils.htmlEscape(message.getName()) + "!");

    }

}
