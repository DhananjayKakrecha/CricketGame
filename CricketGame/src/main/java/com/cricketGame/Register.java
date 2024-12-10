package com.cricketGame;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Random;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String tossValues[] = { "Heads", "Tails" };
	String batOrBall[] = { "bat", "ball" };

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		Random random = new Random();

		if (action.equals("register")) {
			String name = request.getParameter("username");
			CricketPlayer player = new CricketPlayer();
			CricketPlayer cpuPlayer = new CricketPlayer();
			player.setName(name);
			cpuPlayer.setName("Opponent");
			session.setAttribute("player", player);
			session.setAttribute("cpuPlayer", cpuPlayer);
			session.setAttribute("targetScore", -1);
			session.setAttribute("isMatchTied", "no");
			session.setAttribute("tietargetScore", 0);
			response.sendRedirect("instructions.jsp");
		} else if (action.equals("toss")) {
			CricketPlayer player = (CricketPlayer) session.getAttribute("player");
			String tied = (String) session.getAttribute("isMatchTied");

			String tossValue = request.getParameter("choice");
			int randomIndex = random.nextInt(2);
			System.out.println("Random Tossing Value : " + randomIndex);
			String randomToss = tossValues[randomIndex];
			System.out.println("Toss Value Random : " + randomToss);
			System.out.println();

			if (tossValue.equals(randomToss)) {
				if (tied.equals("yes")) {
					session.setAttribute("reason", "Won by Toss!");
					response.sendRedirect("Won.jsp");
				} else {
					response.sendRedirect("choose.jsp");
				}

			} else {
				if (tied.equals("yes")) {
					session.setAttribute("reason", "Loss by Toss!");
					response.sendRedirect("Loss.jsp");
				} else {
					int batorballIdx = random.nextInt(2);
					String chosenValue = batOrBall[batorballIdx];
					System.out.println("Random BATORBALL index : " + batorballIdx);
					System.out.println("CPU Decided : " + chosenValue);
					System.out.println();
					if (chosenValue.equals("bat")) {
						session.setAttribute("role", "Bowl First");
						session.setAttribute("tossWin", "Opponent Chose to Bat");
						response.sendRedirect("decision.jsp");
					} else {
						session.setAttribute("role", "Bat First");
						session.setAttribute("tossWin", "Opponent Chose to Bowl");
						response.sendRedirect("decision.jsp");
					}
				}
			}

		} else if (action.equals("choose")) {
			String chooseValue = request.getParameter("choose");
			CricketPlayer player = (CricketPlayer) session.getAttribute("player");

			if (chooseValue.equals("Bat")) {
				session.setAttribute("role", "Bat First");
				session.setAttribute("tossWin", player.getName() + " Chose to Bat");
				response.sendRedirect("decision.jsp");
			} else {
				session.setAttribute("role", "Bowl First");
				session.setAttribute("tossWin", player.getName() + " Chose to Bowl");
				response.sendRedirect("decision.jsp");
			}
		} else if (action.equals("restart")) {
			session.invalidate();
			HttpSession newSession = request.getSession();
			String name = request.getParameter("username");
			CricketPlayer player = new CricketPlayer();
			CricketPlayer cpuPlayer = new CricketPlayer();
			player.setName(name);
			cpuPlayer.setName("Opponent");
			newSession.setAttribute("player", player);
			newSession.setAttribute("cpuPlayer", cpuPlayer);
			newSession.setAttribute("targetScore", -1);
			newSession.setAttribute("isMatchTied", "no");
			response.sendRedirect("toss.jsp");
		}
	}

}
