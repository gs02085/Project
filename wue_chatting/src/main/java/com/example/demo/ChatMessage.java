package com.example.demo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ChatMessage {
    private String userid;
    private String message;
//   public Integer getRoomSeq() {
//      return roomSeq;
//   }
//   public void setRoomSeq(Integer roomSeq) {
//      this.roomSeq = roomSeq;
//   }
   public String getMessage() {
      return message;
   }
   public String getUserid() {
      return userid;
   }
   public void setUserid(String userid) {
      this.userid = userid;
   }
   public void setMessage(String message) {
      this.message = message;
   }
    
    
}