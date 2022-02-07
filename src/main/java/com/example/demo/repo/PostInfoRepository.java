package com.example.demo.repo;

import com.example.demo.Model.PostInfo;
import org.springframework.data.repository.CrudRepository;

public interface PostInfoRepository extends CrudRepository<PostInfo, Long> {
}
