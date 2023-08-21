package com.example.demo.controller;

import com.example.demo.entity.History;
import com.example.demo.mapper.HistoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/history")
public class HistoryController {

    @Autowired
    HistoryMapper historyMapper ;

    @GetMapping("/allhistory")
    public Object initData() {
        List<History> history = historyMapper.findAll();

        Map map = new HashMap();
        map.put("historyList",history);
        return  map;
    }
    @GetMapping("/returnhistory")
    public Object teturnedData() {
        List<History> history = historyMapper.findReturned();

        Map map = new HashMap();
        map.put("historyList",history);
        return  map;
    }
    @GetMapping("/allborrowed")
    public Object borrowedData() {
        List<History> history = historyMapper.findBorrowed();

        Map map = new HashMap();
        map.put("historyList",history);
        return  map;
    }

    public HistoryController(HistoryMapper historyMapper) {
        this.historyMapper = historyMapper;
    }

    @PostMapping
    public String createHistory(@RequestBody History history) {
        historyMapper.insertHistory(history);
        return  "success";
    }
    @PutMapping
    public String updateHistory(@RequestBody History history) {
        historyMapper.updateEndTime(history);
        return  "success";
    }

    @GetMapping("/historyid")
    public String deleteHistory( int hid) {
        System.out.println("hid="+hid);
        historyMapper.deleteHistory(hid);
        return  "success";
    }
}

