package com.example.demo.repo;

import com.example.demo.Model.File;
import org.springframework.data.repository.CrudRepository;

public interface FileRepository extends CrudRepository<File, Long> {

}
