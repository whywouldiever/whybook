package com.example.demo.mapper;

import com.example.demo.entity.History;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface HistoryMapper {
    @Select("SELECT * FROM t_history")
    List<History> findAll();

    @Select("SELECT * FROM t_history where end_time is null")
    List<History> findBorrowed();

    @Select("SELECT * FROM t_history where end_time is not null")
    List<History> findReturned();

    @Insert("INSERT INTO `t_history` (`hid`, `uid`, `name`, `account`, `bid`, `bookName`, `image`, `begin_time`, `end_time`, `day`, `status`) VALUES (#{hid}, #{uid}, #{name}, #{account}, #{bid}, #{bookName}, #{image}, #{begin_time}, #{end_time}, #{day}, #{status})")
    int insertHistory(History history);

    @Update("UPDATE `t_history` SET end_time= '${end_time}' WHERE hid=#{hid}")
    @Transactional
    void  updateEndTime(History history);

    @Delete("delete from `t_history` where hid = #{hid}")
    @Transactional
    void deleteHistory(int hid);


}
