package com.single.app.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.single.app.DAO.AutoDAOInterface;
import com.single.app.Util.TimeLog;
import com.single.app.Util.Interface.StatusInterface;

import net.sf.json.JSONObject;

@RestController
@RequestMapping(value = "rest")
public class DataController {
	@Autowired
	AutoDAOInterface ADI;
	
	@Autowired
	StatusInterface SI;
	
	@GetMapping(value = "/selectList")
	public void list(@RequestParam Map<String, Object> param, HttpServletResponse res)	{
		JSONObject jobj = JSONObject.fromObject(param);
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		TimeLog.debug("SelectList Log");
		
		try {
			SI.done(200, "json");
			result.put("status", SI.result());
			
			int page_index = Integer.parseInt(param.get("page_index").toString());
			int page_count = Integer.parseInt(param.get("page_count").toString());
			
			param.put("page_index", page_index * page_count);
			param.put("page_count", page_count * 1);
			
			result.put("row", ADI.sql("SL", "test", "list", param));
		} catch (Exception e) {
			e.printStackTrace();
			result.clear();
			
			SI.fail(500, "Error-paging", "페이징 처리중 오류", "테스트");
			result.put("status", SI.result());
			
			result.put("page_index", 0);
			result.put("page_count", 5);
		} finally {
			jobj = JSONObject.fromObject(result);
		}
		
		try {
			res.setContentType("application/json;charset=utf-8");
			res.setCharacterEncoding("utf-8");
			res.getWriter().write(jobj.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
