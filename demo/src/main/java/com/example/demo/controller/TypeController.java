package com.example.demo.controller;

import com.example.demo.entity.Type;
import com.example.demo.mapper.TypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/type")
public class TypeController {

    @Autowired
    TypeMapper typeMapper ;

    @GetMapping
    public Object initData() {
        List<Type> type = typeMapper.findAll();

        Map map = new HashMap();
        map.put("typeList",type);
        return  map;
    }
}
