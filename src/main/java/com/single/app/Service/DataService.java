package com.single.app.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.single.app.DAO.AutoDAOInterface;
import com.single.app.Service.Interface.DataServiceInterface;
import com.single.app.Util.Interface.StatusInterface;

@Service
public class DataService implements DataServiceInterface {
	
	@Autowired
	AutoDAOInterface ADI;
	
	StatusInterface SI;
	
	public Map<String, Object> insertLayout(Map<String, Object> params) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		System.out.println(params);

		result.put("status", ADI.sql("IS", "postgreSQL", "layoutInsert", params));
		
		return result;
	}

	@Override
	public Map<String, Object> insertLayoutContent(Map<String, Object> params) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		
		System.out.println(params);

		result.put("status", ADI.sql("IS", "postgreSQL", "layoutContentInsert", params));
		
		return result;
	}

	@Override
	public Map<String, Object> deleteLayoutContent(Map<String, Object> params) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		
		System.out.println(params);

		result.put("status", ADI.sql("DL", "postgreSQL", "layoutContentDelete", params));
		
		return result;
	}
	
	@Override
	public Map<String, Object> updateLayoutContent(Map<String, Object> params) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("status", ADI.sql("DL", "postgreSQL", "layoutContentDelete", params));
		List<Map<String, Object>> item = (List<Map<String, Object>>) params.get("item");
		int itemSize = item.size();
		for(int i = 0; i < itemSize; i++) {
			item.get(i).put("layoutNo", params.get("layoutNo"));
			result.put("status", ADI.sql("IS", "postgreSQL", "layoutContentInsert", item.get(i)));
		}
		
		return result;
	}
}
