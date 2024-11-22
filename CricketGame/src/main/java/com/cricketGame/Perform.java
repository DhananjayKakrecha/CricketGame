package com.cricketGame;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

/**
 * Servlet implementation class Perform
 */
@WebServlet("/Perform")
public class Perform extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CricketPlayerService playerService = new CricketPlayerService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		if (action.equals("play")) {
			int userNumber = Integer.parseInt(request.getParameter("scoreMade"));
			CricketPlayer player = (CricketPlayer) session.getAttribute("player");
			playerService.batting(userNumber, player);
			response.sendRedirect("cricketplay.jsp");
		} else if (action.equals("ball")) {
			int guessNum = Integer.parseInt(request.getParameter("guessNum"));
			CricketPlayer cpuPlayer = (CricketPlayer) session.getAttribute("cpuPlayer");
			playerService.balling(guessNum, cpuPlayer);
			response.sendRedirect("cricketball.jsp");
		}else if(action.equals("batTimeOut")) {
			CricketPlayer player = (CricketPlayer) session.getAttribute("player");
			player.setTotalWickets();
			player.setBallsPlayed();
			response.sendRedirect("cricketplay.jsp");
		}else if(action.equals("ballTimeOut")) {
			CricketPlayer cpuPlayer = (CricketPlayer) session.getAttribute("cpuPlayer");
			cpuPlayer.setScoreRecord(6);
			cpuPlayer.setTotalScore(cpuPlayer.getTotalScore()+6);
			response.sendRedirect("cricketball.jsp");
		}

	}
}
