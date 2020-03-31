package com.single.app.Controller;

import java.io.IOException;
import java.net.http.HttpResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.bytecode.analysis.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.single.app.DAO.AutoDAOInterface;
import com.single.app.Util.timeLog;

import net.sf.json.JSONObject;

@RestController
@RequestMapping(value = "rest")
public class DataController {
	@Autowired
	AutoDAOInterface ADI;
	
	@GetMapping(value = "/selectList")
	public void list(@RequestParam Map<String, Object> param, HttpServletResponse res)	{
		JSONObject jobj = JSONObject.fromObject(param);
		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String, Object> status = new HashMap<String, Object>();
		
		timeLog.debug("test debug");
		
		try {
			status.put("response", 200);
			status.put("type", "json");
			
			int page_index = Integer.parseInt(param.get("page_index").toString());
			int page_count = Integer.parseInt(param.get("page_count").toString());
			
			param.put("page_index", page_index * page_count);
			param.put("page_count", page_count * 1);
			
			result = ADI.sql("SL", "test", "list", param);
			
			jobj = JSONObject.fromObject(result);
		} catch (Exception e) {
			status.put("response", 404);
			status.put("type", "json");
			
			e.printStackTrace();
			JSONObject exception_map = new JSONObject();
			exception_map.put("page_index", 0);
			exception_map.put("page_count", 5);
			
			jobj = exception_map;
		}
		
		try {
			res.setContentType("application/json;charset=utf-8");
			res.setCharacterEncoding("utf-8");
			res.getWriter().write(jobj.toString());
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
}
