package com.example.demo.Model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Group {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long groupID;

    private Date date;

    @ManyToOne
    @JoinColumn(name = "userID")
    private User user;

    private String title;



    public Long getGroupID() {
        return groupID;
    }

    public void setGroupID(Long idgroup) {
        this.groupID = idgroup;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
