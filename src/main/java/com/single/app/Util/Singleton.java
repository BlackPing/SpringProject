package com.single.app.Util;

import java.util.HashMap;

/**
 * @ÀÛ¼ºÀÚ	black_ping
 * @since	2020-03-09
 * @Method	½Ì±ÛÅæ ±â¹ý
 */
public class Singleton {
	private static Singleton instance;
	public HashMap<String, Object> result = new HashMap<String, Object>();
	
	private Singleton() {}
	
	public static Singleton getInstance() {
		if(instance == null) instance = new Singleton();
		return instance;
	}
	
	public void done(int code, String type)	{
		result.clear();
		result.put("response", code);
		result.put("type", type);
	}
	
	public void fail(int code, String... args) {
		result.clear();
		result.put("response", code);
	}
	
	public HashMap<String, Object> result() {
		return result;
	}
}
