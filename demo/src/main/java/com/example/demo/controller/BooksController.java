package com.example.demo.controller;

import com.example.demo.entity.Books;
import com.example.demo.mapper.BooksMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/books")
public class BooksController {

    @Autowired
    BooksMapper booksMapper ;

    @GetMapping
    public Object initData() {
        List<Books> books = booksMapper.findAll();

        Map map = new HashMap();
        map.put("bookList",books);
        return  map;
    }
    /**
     * 根据书名或读者搜索图书
     * @return应该是book里面
     * booksmapper
     */
    @GetMapping("/search")
    public Object searchBookByNameOrAuthor(String keyword){
        try{
            List<Books> books = booksMapper.searchBookByNameOrAuthor(keyword);
            HashMap map = new HashMap<>();
            map.put("list",books);
            return map;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}


