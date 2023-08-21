package com.example.demo.controller;

import com.example.demo.entity.Problem;
import com.example.demo.mapper.ProblemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/problem")
public class ProblemController {

    @Autowired
    ProblemMapper problemMapper;

    @GetMapping
    public Object initData() {
        List<Problem> problem = problemMapper.findAll();

        Map map = new HashMap();
        map.put("problemList", problem);
        return map;
    }

    @PostMapping
    public String createProblem(@RequestBody Problem problem) {
        problemMapper.insertProblem(problem);
        return "success";
    }
}