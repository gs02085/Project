package com.example.demo;

//import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.messaging.SessionConnectEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
public class ChatController {
    private static final Set<String> SESSION_IDS = new HashSet<>();
    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @MessageMapping("/chat") // "/pub/chat"
    public void publishChat(ChatMessage chatMessage) {
        //log.info("publishChat : {}", chatMessage);
    	System.out.println("!!!"+chatMessage.getMessage());
        messagingTemplate.convertAndSend("/sub/chat/", chatMessage);
    }

    @EventListener(SessionConnectEvent.class)
    public void onConnect(SessionConnectEvent event) {
        String sessionId = event.getMessage().getHeaders().get("simpSessionId").toString();
        SESSION_IDS.add(sessionId);
        //log.info("[connect] connections : {}", SESSION_IDS.size());
    }

    @EventListener(SessionDisconnectEvent.class)
    public void onDisconnect(SessionDisconnectEvent event) {
        String sessionId = event.getSessionId();
        SESSION_IDS.remove(sessionId);
        //log.info("[disconnect] connections : {}", SESSION_IDS.size());
    }
}