package com.single.app.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.single.app.DAO.AutoDAOInterface;
import com.single.app.Service.Interface.DataServiceInterface;
import com.single.app.Util.TimeLog;
import com.single.app.Util.Interface.StatusInterface;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@RestController
@RequestMapping(value = "rest")
public class DataController {
	@Autowired
	AutoDAOInterface ADI;
	
	@Autowired
	StatusInterface SI;
	
	@Autowired
	DataServiceInterface DS;
	
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
			result.put("count", ADI.sql("SO", "test", "count", param));
		} catch (Exception e) {
			e.printStackTrace();
			result.clear();
			
			SI.fail(500, "Error-paging", "����¡ ó���� ����", "�׽�Ʈ");
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
	
	@GetMapping(value = "/selectLayout")
	public void selectLayout(@RequestParam Map<String, Object> param, HttpServletResponse res)	{
		JSONObject jobj = JSONObject.fromObject(param);
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		TimeLog.debug("SelectList Log");
		
		try {
			SI.done(200, "json");
			result.put("status", SI.result());
			
			result.put("row", ADI.sql("SL", "postgreSQL", "layout", param));
		} catch (Exception e) {
			e.printStackTrace();
			result.clear();
			
			SI.fail(500, "Error-paging", "에러메세지", "에러에러");
			result.put("status", SI.result());
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
	
	@GetMapping(value = "/selectLayoutContent")
	public void selectLayoutContent(@RequestParam Map<String, Object> param, HttpServletResponse res)	{
		JSONObject jobj = JSONObject.fromObject(param);
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		System.out.println(param.toString());
		
		TimeLog.debug("SelectList Log");
		
		try {
			SI.done(200, "json");
			result.put("status", SI.result());
			
			result.put("row", ADI.sql("SL", "postgreSQL", "layoutContent", param));
		} catch (Exception e) {
			e.printStackTrace();
			result.clear();
			
			SI.fail(500, "Error-paging", "에러메세지", "에러에러");
			result.put("status", SI.result());
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
	
	@PostMapping(value = "/insertLayout")
	public void insertLayout(@RequestParam Map<String, Object> params, HttpServletResponse res)	{
		JSONObject jobj;
		Map<String, Object> result = new HashMap<String, Object>();
		
		TimeLog.debug("insert Log");
		
		try {
			SI.done(200, "json");
			DS.insertLayout(params);
			result.put("status", SI.result());
		} catch (Exception e) {
			e.printStackTrace();
			result.clear();
			
			SI.fail(500, "Error-SQL", "insertLayout", "관리자에게 문의해주세요.");
			result.put("status", SI.result());
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
	
	@PostMapping(value = "/updateLayoutContent")
	public void updateLayout(@RequestParam Map<String, Object> params, HttpServletResponse res)	{
		JSONObject jobj;
		JSONArray jarray = JSONArray.fromObject(params.get("item"));
		params.put("item", (List<Map<String, Object>>) jarray);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		TimeLog.debug("insert Log");
		
		try {
			SI.done(200, "json");
			DS.updateLayoutContent(params);
			result.put("status", SI.result());
		} catch (Exception e) {
			e.printStackTrace();
			result.clear();
			
			SI.fail(500, "Error-SQL", "insertLayout", "관리자에게 문의해주세요.");
			result.put("status", SI.result());
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
