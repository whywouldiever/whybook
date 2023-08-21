package com.example.demo.mapper;

import com.example.demo.entity.Type;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TypeMapper {
    @Select("SELECT * FROM t_type")
    List<Type> findAll();
}
