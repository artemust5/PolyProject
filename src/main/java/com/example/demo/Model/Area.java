package com.example.demo.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Area {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long areaID;

    private String areaInfo;

    public Long getAreaID() {
        return areaID;
    }

    public void setAreaID(Long idareas) {
        this.areaID = idareas;
    }

    public String getAreaInfo() {
        return areaInfo;
    }

    public void setAreaInfo(String areas_info) {
        this.areaInfo = areas_info;
    }
}
