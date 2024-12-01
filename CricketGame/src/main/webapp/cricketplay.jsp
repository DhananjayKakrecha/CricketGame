<%@page import="com.cricketGame.CricketPlayerService"%>
<%@page import="com.cricketGame.CricketPlayer"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cricket Game</title>
    <style>
      body {
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        height: 100vh;
        font-family: Arial, sans-serif;
        color: #ffffff;
        background-color: #1a1a1a; /* Simple dark background */
      }

      header {
        text-align: center;
        padding: 10px;
        background-color: #d9fdd3;
        color: #007844;
        font-size: 24px;
        font-weight: bold;
      }

      header .subtitle {
        font-size: 16px;
        color: black;
      }

      .split-screen {
        display: flex;
        flex: 1;
      }

      .left-section,
      .right-section {
        width: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
      }

      .left-section {
        background-color: #c0eba6;
      }

      .right-section {
        background-color: #9edf9c;
      }
      
      .form-container {
        text-align: center;
        color: #141e46;
      }

      .form-container h1 {
        margin-bottom: 20px;
        font-size: 24px;
      }

      .form-container input,
      .form-container button {
        display: block;
        margin: 10px auto;
        padding: 10px;
        font-size: 16px;
        width: 80%;
      }

      .six-animation {
        font-size: 5rem;
        font-weight: bold;
        color: #141e46;
        position: absolute;
        opacity: 0;
        animation: appearZoomFade 2s ease-out forwards;
      }

      @keyframes appearZoomFade {
        0% {
          transform: scale(0);
          opacity: 0;
        }
        40% {
          transform: scale(1.5);
          opacity: 1;
        }
        80% {
          transform: scale(1.2);
          opacity: 1;
        }
        100% {
          transform: scale(1);
          opacity: 1;
        }
      }

      footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #333;
        padding: 10px;
      }

      .total-score,
      .target-score {
        font-size: 18px;
        color: #fccd2a;
        font-weight: bold;
      }

      .number-boxes {
        display: flex;
        gap: 5px;
        justify-content: center;
        flex-wrap: wrap;
        width: 40%;
      }

      .number-box {
        background-color: #444;
        color: #fccd2a;
        font-size: 18px;
        font-weight: bold;
        text-align: center;
        width: 18px; /* Match font-size */
        height: 18px; /* Match font-size */
        display: flex;
        justify-content: center;
        align-items: center;
        border: 1px solid #555;
      }
      
      #time-over{
      	display:none;
      }
      
      a{
       text-decoration:none;
       text-styel:none;
      }
    </style>
  </head>
  <body>
    <%
	CricketPlayer player = (CricketPlayer) session.getAttribute("player");
	ArrayList<Integer> scoreRecord = player.getScoreRecord();
	int totalWicketes = player.getTotalWickets();
	String tossResult = (String) session.getAttribute("tossWin");
	tossResult.strip();
	CricketPlayerService playerService = new CricketPlayerService();

	String role = (String) session.getAttribute("role");
	role.strip();
	
	String tied = (String) session.getAttribute("isMatchTied");
	tied.strip();

	int targetScore = (Integer) session.getAttribute("targetScore");
	String result = "Start";
	if(!scoreRecord.isEmpty()){
		int score = scoreRecord.get(scoreRecord.size()-1);
		result = String.valueOf(score);
		if(score == -1){
			result = "OUT";
		}
	}
	
	%>


    <!-- Header Section -->
    <header>
      Cricket Game
      <div class="subtitle"><%=player.getName()%> Batting</div>
    </header>

    <!-- Split Screen Section -->
    <div class="split-screen">
      <!-- Left Section with Form -->
      <div class="left-section">
        <div class="form-container">
            <% if (playerService.canBat(totalWicketes, player.getTotalScore(), targetScore, player.getBallsPlayed(), role, tied)) {
                %>
                    <p class="timer">
                    Time Left: <span id="timer">15</span> seconds
                </p>
          <h1>Play</h1>
          <form id="playerForm" action="Perform" method="POST">
            <input
              type="number"
              id="user-input"
              name="scoreMade"
              placeholder="Enter Score"
              min="1" max="6" autocomplete="off"
              required
            />
            <input type="hidden" name="action" value="play">
            <button type="submit" id="submit-btn">Submit</button>
          </form>
           <p id="time-over">Time Over!</p> 
          <%
	}
	%>

    <%
    if (role.equals("Bowl First")) {
        if (player.getTotalScore() > targetScore) {
            session.setAttribute("reason", "Target Achieved!");
            response.sendRedirect("Won.jsp");
        }
    }
    %>

    <%
	if (totalWicketes == 1) {
	%>
	<h1>OUT!!!!</h1>
	<%
	if (role.equals("Bat First")) {
		session.setAttribute("targetScore", player.getTotalScore());
	%>
	<form action="cricketball.jsp" method="post">
		<button type="submit">Ball</button>
	</form>
	<%
	} else {
		if(targetScore == player.getTotalScore()){
			session.setAttribute("isMatchTied","yes");
			response.sendRedirect("toss.jsp");
		}else{
			session.setAttribute("reason", "Out! Target didn't achived!");
			response.sendRedirect("Loss.jsp");
		}
	
	}
	}
	%>

    <%
	if (player.getBallsPlayed() >= 18) {
	%>
	<h1>Overs done</h1>
	<%
	if (role.equals("Bat First")) {
		session.setAttribute("targetScore", player.getTotalScore());
	%>
	<form action="cricketball.jsp" method="post">
		<button type="submit">Ball</button>
	</form>
	<%
	} else {
		if(targetScore == player.getTotalScore()){
			session.setAttribute("isMatchTied","yes");
			response.sendRedirect("toss.jsp");
		}else{
			session.setAttribute("reason", "Game Over!, Target didn't achieved!");
			response.sendRedirect("Loss.jsp");
		}
	}
	}
	%>

        </div>
      </div>

     


      <!-- Right Section with Animation -->
      <div class="right-section">
        <div class="six-animation" id="six"><%= result%>!</div>
      </div>
    </div>

    <form id="timeOut" style="display: none;" action="Perform"
		method="post">
		<input type="hidden" name="action" value="batTimeOut"> <input
			type="submit">
	</form>

    <!-- Footer Section -->
    <footer>
      <!-- Total Score -->
      <div class="total-score">Total Score: <span id="totalScore"><%=player.getTotalScore()%></span></div>

      <!-- Number Boxes -->
      <div class="number-boxes">
        <!-- Generate 18 number boxes dynamically -->
        <%
	if (scoreRecord != null) {
		for (int score : scoreRecord) {
	%>
    <div class="number-box"><%=score%></div>
    <%
	}
	}
	%>
        <!-- <script>
          for (let i = 1; i <= 18; i++) {
            document.write(`<div class="number-box">${i}</div>`);
          }
        </script> -->
      </div>

      <!-- Target Score -->
      <% int scoreNeeded = ((targetScore+1)-(player.getTotalScore()));%>
      <% if(targetScore >= 0){ %>
      <div class="target-score">
        Target Score: <span id="targetScore"><%= targetScore+1%></span>
      </div>
      <div class="target-score">
        Need: <span id="targetScore"><%= scoreNeeded%></span>
      </div>
      <%} %>
    </footer>

    <script>
      window.onload = function () {
        // Trigger animation and keep the text visible after animation ends
        const sixElement = document.getElementById("six");

        // Ensure the animation plays on page load
        sixElement.style.display = "block";

        let timeLeft = 15; // Set the time limit in seconds
	        const timerElement = document.getElementById('timer');
	        const inputField = document.getElementById('user-input');
	        const submitButton = document.getElementById('submit-btn');
	        const timeOverMessage = document.getElementById('time-over');

	        inputField.focus();
	        // Countdown timer
	        const timerInterval = setInterval(() => {
	            if (timeLeft > 0) {
	                timeLeft--;
	                timerElement.textContent = timeLeft;
	            } else {
	                // Time over
	                clearInterval(timerInterval);
	                inputField.disabled = true;
	                submitButton.disabled = true;
	                timeOverMessage.style.display = 'block';
	                document.getElementById('timeOut').submit();
	            }
	        }, 1000);

        // Add event listener to ensure final state is applied
        sixElement.addEventListener("animationend", () => {
          sixElement.style.opacity = "1"; // Keep text visible
          sixElement.style.transform = "scale(1)"; // Ensure final size is applied
          sixElement.style.animation = "none"; // Stop further animation
        });
      };
    </script>
  </body>
</html>




