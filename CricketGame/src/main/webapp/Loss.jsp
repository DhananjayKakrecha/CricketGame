<%@page import="com.cricketGame.CricketPlayer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Split Page with Animation</title>
<style>
body {
	margin: 0;
	padding: 0;
	display: flex;
	height: 100vh;
	font-family: Arial, sans-serif;
	background-color: #282c34;
	color: #ffffff;
}

.left-section, .right-section {
	width: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.left-section {
	background-color: #c0eba6;
}

.right-section {
	background-color: #9edf9c;
	position: relative;
}

.form-container {
	text-align: center;
	color: #141e46;
}

.form-container h1 {
	margin-bottom: 20px;
}

.form-container input, .form-container button {
	display: block;
	margin: 10px auto;
	padding: 10px;
	font-size: 16px;
	width: 80%;
}

.six-animation {
	font-size: 8rem;
	font-weight: bold;
	color: #141e46;
	position: absolute;
	opacity: 0;
	animation: appearZoomFade 2s ease-out forwards;
}

@
keyframes appearZoomFade { 0% {
	transform: scale(0);
	opacity: 0;
}
40
%
{
transform
:
scale(
1.5
);
opacity
:
1;
}
80
%
{
transform
:
scale(
1.2
);
opacity
:
1;
}
100
%
{
transform
:
scale(
1
);
opacity
:
1;
}
}
</style>
</head>
<body>
	<%
	CricketPlayer player = (CricketPlayer) session.getAttribute("player");
	CricketPlayer cpuPlayer = (CricketPlayer) session.getAttribute("cpuPlayer");
	String reason = (String) session.getAttribute("reason");
	int targetScore = (Integer) session.getAttribute("targetScore");
	%>

	<!-- Left section with form -->
	<div class="left-section">
		<div class="form-container">
			<h1><%=player.getName()%>
				Lost!
			</h1>
			<h2><%=reason%></h2>
			<h3>
				Total Score:
				<%=player.getTotalScore()%></h3>
			<h3>
				Target Score:
				<%=targetScore%></h3>
			<h3>
				Balls Played:
				<%=player.getBallsPlayed()%></h3>
			<h3>Opponent</h3>
			<h3>
				Total Score:
				<%=cpuPlayer.getTotalScore()%></h3>
			<h3>
				Balls Played:
				<%=cpuPlayer.getBallsPlayed()%></h3>

			<form id="playerForm" action="Register" method="POST">
				<input type="hidden" name="username" value="<%=player.getName()%>">
				<input type="hidden" name="action" value="restart">
				<button type="submit">Play Again!</button>
			</form>
		</div>
	</div>

	<!-- Right section with animation -->
	<div class="right-section">
		<div class="six-animation" id="six">LOSS!!</div>
	</div>

	<script>
        window.onload = function() {
        	// Trigger animation and keep the text visible after animation ends
            const sixElement = document.getElementById("six");

            // Ensure the animation plays on page load
            sixElement.style.display = "block";

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
