package com.example.demo.controllers;

import com.example.demo.Model.User;
import com.example.demo.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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

}
