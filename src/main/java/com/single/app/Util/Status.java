package com.single.app.Util;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import com.single.app.Util.Interface.StatusInterface;

/**
 * @�ۼ���	black_ping
 * @since	2020-03-09
 * @Method	���� �ý��� ���� ����
 * �̱���
 */

@Component
public class Status implements StatusInterface {
	public HashMap<String, Object> result = new HashMap<String, Object>();
	
	private Status() {}
	
	public void done(int code, String type)	{
		result.clear();
		result.put("response", code);
		result.put("type", type);
	}
	
	
	public void fail(int code, String... args) {
		result.clear();
		result.put("response", code);
		
		HashMap<String, Object> error = new HashMap<String, Object>();
		
		// 0: error-code, 1: message, 2: comment
		try {
			error.put("errorCode", args[0]);
			error.put("errorMsg", args[1]);
			error.put("errorComment", args[2]);
			result.put("error", error);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Status Class Error 0: error-code, 1: message, 2: comment");
		}
	}
	
	public HashMap<String, Object> result() {
		return result;
	}
}
