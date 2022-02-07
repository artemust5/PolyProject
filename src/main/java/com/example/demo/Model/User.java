package com.example.demo.Model;

import javax.persistence.*;

@Entity // This tells Hibernate to make a table out of this class
public class User{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)

    private Long userID;

   private String email;

   private String password;

   private Integer graduationYear;

   private String type;

   private String work;

   private String username;

   private String firstName;

   private String lastName;

   private String middleName;

    public Long getUserID() {
        return userID;
    }

    public void setUserID(Long iduser) {
        this.userID = iduser;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String mail) {
        this.email = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getGraduationYear() {
        return graduationYear;
    }

    public void setGraduationYear(Integer graduation_year) {
        this.graduationYear = graduation_year;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String first_name) {
        this.firstName = first_name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String last_name) {
        this.lastName = last_name;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middle_name) {
        this.middleName = middle_name;
    }
}