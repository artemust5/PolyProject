package com.example.demo.securingweb;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.example.demo.Model.User;
import com.example.demo.securingweb.UserRegistrationDto;

interface UserService extends UserDetailsService {

    User findByEmail(String email);

    User save(UserRegistrationDto registration);
}
