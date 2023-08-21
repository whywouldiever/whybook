package com.example.demo.mapper;

import com.example.demo.entity.Problem;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ProblemMapper {
    @Select("SELECT * FROM t_problem")
    List<Problem> findAll();

        @Insert("INSERT INTO `books`.`t_problem` (`pid`, `uid`, `title`, `page`, `content`, `link`, `status`, `time`) VALUES (#{pid}, #{uid}, #{title}, #{page}, #{content}, #{link}, #{status}, #{time});")
        int insertProblem(Problem problem);
    }
