package com.single.app.Service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.single.app.DAO.AutoDAOInterface;

@Service
public class testService {
	
	@Autowired
	AutoDAOInterface dao;
	public void test() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map = dao.sql("SO", "test", "test2", null);
		
		System.out.println(map.toString());
	}
}
