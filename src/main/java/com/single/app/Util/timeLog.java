package com.single.app.Util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ÀÛ¼ºÀÚ	black_ping
 * @since	2020-03-31
 * @Method	log system
 */
public class timeLog {
	public static void debug(String str) {
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);

		System.out.println("[Debug] " + time1 + " " + str);
	}
}
