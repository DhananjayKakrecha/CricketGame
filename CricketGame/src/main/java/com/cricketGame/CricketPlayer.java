package com.cricketGame;

import java.util.ArrayList;

public class CricketPlayer {
	private String name;
	private int totalScore;
	private ArrayList<Integer> scoreRecord = new ArrayList<>();
	private int totalWickets;
	private int tietargetScore;
	private String role;
	private int ballsPlayed;
	private int tieTotalScore;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}

	public ArrayList<Integer> getScoreRecord() {
		return scoreRecord;
	}

	public void setScoreRecord(int scoreRecord) {
		this.scoreRecord.add(scoreRecord);
	}

	public int getTotalWickets() {
		return this.totalWickets;
	}

	public void setTotalWickets() {
		System.out.println("Calling Setter for Wickets");
		this.totalWickets++;
	}

	public int getTieTargetScore() {
		return tietargetScore;
	}

	public void setTieTargetScore(int targetScore) {
		this.tietargetScore = targetScore;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getBallsPlayed() {
		return ballsPlayed;
	}

	public void setBallsPlayed() {
		this.ballsPlayed++;
	}
	
	public void updateBallsPlayed() {
		this.ballsPlayed = 0;
	}
	
	public void updateTotalWickets() {
		this.totalWickets = 0;
	}

	public int getTieTotalScore() {
		return tieTotalScore;
	}

	public void setTieTotalScore(int tieTotalScore) {
		this.tieTotalScore = tieTotalScore;
	}
}
