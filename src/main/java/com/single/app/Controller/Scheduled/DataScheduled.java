package com.single.app.Controller.Scheduled;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class DataScheduled {
	
	@Scheduled(cron = "0 12 15 * * * ")
	public void AScheduled() {
		System.out.println("스케쥴러 실행!");
	}
	
	@Scheduled(fixedDelay = 5000)
	public void testScheduled() {
		System.out.println("5sec...");
	}
	
}
