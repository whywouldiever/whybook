package com.example.demo.entity;

public class User {
    private Integer uid;
    private String account;
    private String name;
    private String password;
    private String phone;
    private Integer times;
    private Integer lend_num;
    private Integer max_num;
    private Integer role;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getTimes() {
        return times;
    }

    public void setTimes(Integer times) {
        this.times = times;
    }

    public Integer getLend_num() {
        return lend_num;
    }

    public void setLend_num(Integer lend_num) {
        this.lend_num = lend_num;
    }

    public Integer getMax_num() {
        return max_num;
    }

    public void setMax_num(Integer max_num) {
        this.max_num = max_num;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }
}
