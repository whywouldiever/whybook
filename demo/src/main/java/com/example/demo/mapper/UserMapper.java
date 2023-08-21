package com.example.demo.mapper;


import com.example.demo.entity.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {
    @Select("SELECT * FROM t_user")
    List<User> findAll();
}
