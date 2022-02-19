package com.example.demo.Controllers;



import com.example.demo.Model.User;
import com.example.demo.repo.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    @Autowired
    private UserRepository repository;

    @Autowired
    private UpdatableBCrypt bCryptPasswordEncoder;


    @PostMapping("/")
    public void home(@RequestBody User user){
        repository.save(user);
    }
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView processRegister(@ModelAttribute("user") User userRegistrationObject) {
        String encodedPassword = bCryptPasswordEncoder.hashpw(userRegistrationObject.getPassword(), BCrypt.gensalt());

        User user = new User(userRegistrationObject.getEmail(), encodedPassword);
        repository.save(user);
        return new ModelAndView("redirect:/welcome");
    }

}
