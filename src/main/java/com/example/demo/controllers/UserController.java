package com.example.demo.controllers;

import com.example.demo.Model.User;
import com.example.demo.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class UserController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/user")
    public String getUsers(Model model){

        Iterable<User> users = userRepository.findAll();
        model.addAttribute("users", users);

        return "users";
    }
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(@ModelAttribute("student") User user, Model model) {
        user.setFirstName(String.valueOf(user));
        user.setMiddleName(String.valueOf(user));
        user.setLastName(String.valueOf(user));
        user.setEmail(String.valueOf(user));
        user.setPassword(String.valueOf(user));
        user.setUsername(String.valueOf(user));
        user.setGraduationYear(Integer.valueOf(String.valueOf(user)));
        user.setWork(String.valueOf(user));

        return "welcome";
    }
}
