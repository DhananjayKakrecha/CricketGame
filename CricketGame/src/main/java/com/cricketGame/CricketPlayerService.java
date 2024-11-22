package com.cricketGame;

import java.util.Random;

public class CricketPlayerService {
	private Random random = new Random();
	
	public void batting(int scoreMade,CricketPlayer player) {
		int randomNumber = random.nextInt(7);
		System.out.println("Random Number Generated while Batting by User: " + randomNumber + " Usernum : " + scoreMade);
		if(scoreMade != randomNumber) {
			player.setScoreRecord(scoreMade);
			player.setTotalScore(scoreMade+player.getTotalScore());
		}else {
			player.setTotalWickets();
			player.setScoreRecord(-1);
		}
		player.setBallsPlayed();
	}
	
	public void balling(int guessNum,CricketPlayer cpuPlayer) {
		int randomNumber = random.nextInt(7);
		System.out.println("Random Number Generated while Balling by User : " + randomNumber + " Usernum : " + guessNum);
		if(guessNum == randomNumber) {
			cpuPlayer.setTotalWickets();
			cpuPlayer.setScoreRecord(-1);
		}else {
			cpuPlayer.setScoreRecord(randomNumber);
			cpuPlayer.setTotalScore(randomNumber+cpuPlayer.getTotalScore());
		}
		cpuPlayer.setBallsPlayed();
	}
	
	public boolean canBat(int totalWickets,int totalScore,int targetScore,int ballsPlayed,String role, String tied) {
		boolean result = false;
		
		if(totalWickets != 1 && ballsPlayed < 18) {
			return true;
		}
		
		return result;
	}
	
	
	
	
}
