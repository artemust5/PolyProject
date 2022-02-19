package com.example.demo.Model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class PostInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long postInfoID;

    private Date date;

    private String title;

    private Integer estimates;

    @ManyToOne
    @JoinColumn(name = "userID")
    private User user;

    private Byte photo;

    private String description;

    public Long getPostInfoID() {
        return postInfoID;
    }

    public void setPostInfoID(Long idpostinfo) {
        this.postInfoID = idpostinfo;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getEstimates() {
        return estimates;
    }

    public void setEstimates(Integer estimates) {
        this.estimates = estimates;
    }

    public User getUser_iduser() {
        return user;
    }

    public void setUser_iduser(User user_iduser) {
        this.user = user_iduser;
    }

    public Byte getPhoto() {
        return photo;
    }

    public void setPhoto(Byte photo) {
        this.photo = photo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
