package com.single.app.Service.Interface;

import java.util.Map;

public interface DataServiceInterface {
	public Map<String, Object> insertLayout(Map<String, Object> params) throws Exception;
	public Map<String, Object> insertLayoutContent(Map<String, Object> params) throws Exception;
	public Map<String, Object> deleteLayoutContent(Map<String, Object> params) throws Exception;
	public Map<String, Object> updateLayoutContent(Map<String, Object> params) throws Exception;
}