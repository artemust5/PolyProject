package com.example.demo.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Hobbie {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long hobbieID;

    private String hobbieInfo;

    public Long getHobbieID() {
        return hobbieID;
    }

    public void setHobbieID(Long idhobbie) {
        this.hobbieID = idhobbie;
    }

    public String getHobbieInfo() {
        return hobbieInfo;
    }

    public void setHobbieInfo(String hobbie_info) {
        this.hobbieInfo = hobbie_info;
    }
}
