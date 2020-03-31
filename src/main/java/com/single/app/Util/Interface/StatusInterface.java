package com.single.app.Util.Interface;

import java.util.HashMap;

public interface StatusInterface {
	public void done(int code, String type);
	public void fail(int code, String... args);
	public HashMap<String, Object> result();
}
