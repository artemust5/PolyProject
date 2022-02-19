package com.example.demo.repo;

import com.example.demo.Model.Hobby;
import org.springframework.data.repository.CrudRepository;

public interface HobbyRepository extends CrudRepository<Hobby, Long> {
}
