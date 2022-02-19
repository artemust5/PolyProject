package com.example.demo.Model;

import javax.persistence.*;

@Entity
public class File {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long fileID;

    private String document;

    @ManyToOne
    @JoinColumn(name = "chatID")
    private Chat chat;

    @ManyToOne
    @JoinColumn(name = "postChatID")
    private PostChat postChat;

    public Long getFileID() {
        return fileID;
    }

    public void setFileID(Long fileID) {
        this.fileID = fileID;
    }

    public String getDocument() {
        return document;
    }

    public void setDocument(String document) {
        this.document = document;
    }

    public Chat getChat() {
        return chat;
    }

    public void setChat(Chat chat) {
        this.chat = chat;
    }

    public PostChat getPostChat() {
        return postChat;
    }

    public void setPostChat(PostChat postChat) {
        this.postChat = postChat;
    }
}
