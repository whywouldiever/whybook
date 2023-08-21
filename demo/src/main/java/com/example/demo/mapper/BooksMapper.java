package com.example.demo.mapper;

import com.example.demo.entity.Books;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BooksMapper {
    @Select("SELECT * FROM t_book ORDER BY borrowed DESC")
    List<Books> findAll();

    @Select("select * from t_book where bookName like '%${keyword}%' or author like '%${keyword}%'")
    List<Books> searchBookByNameOrAuthor(String keyword);
}
