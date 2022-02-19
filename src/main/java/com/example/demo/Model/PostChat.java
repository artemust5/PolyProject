package com.example.demo.Model;

import javax.persistence.*;

@Entity
public class PostChat {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long postChatID;

    private String comment;

    private Integer like;

    @ManyToOne
    @JoinColumn(name = "postInfoID")
    private PostInfo postInfo;

    @ManyToOne
    @JoinColumn(name = "userID")
    private User user;


    public Long getPostChatID() {
        return postChatID;
    }

    public void setPostChatID(Long postChatID) {
        this.postChatID = postChatID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getLike() {
        return like;
    }

    public void setLike(Integer like) {
        this.like = like;
    }

    public PostInfo getPostInfo() {
        return postInfo;
    }

    public void setPostInfo(PostInfo postInfo) {
        this.postInfo = postInfo;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
