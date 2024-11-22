<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Timed Input</title>
<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
	margin: 50px;
}

.timer {
	font-size: 24px;
	margin-bottom: 20px;
}

.input-section {
	margin-top: 20px;
}

#time-over {
	color: red;
	font-weight: bold;
	display: none;
}
</style>

</head>
<body>
	<%
	String username = (String) session.getAttribute("username");
	username.strip();
	
	%>

	Username: <%= username %>
	<h1>Input Game</h1>
	<p class="timer">
		Time Left: <span id="timer">10</span> seconds
	</p>
	<div class="input-section">
		<form action="Perform" method="post">
			<input type="number" id="user-input" name="scoreMade"
				placeholder="Enter your input here" />
			<input type="hidden" name="action" value="play">
			<button type="submit" id="submit-btn">Submit</button>
		</form>
	</div>
	<p id="time-over">Time Over!</p>

	<script>
        let timeLeft = 10; // Set the time limit in seconds
        const timerElement = document.getElementById('timer');
        const inputField = document.getElementById('user-input');
        const submitButton = document.getElementById('submit-btn');
        const timeOverMessage = document.getElementById('time-over');

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
            }
        }, 1000);

        // Function to handle user input submission
        function submitInput() {
            const userInput = inputField.value;
            alert("You submitted: " + userInput);
            inputField.value = ""; // Clear the input field
        }
    </script>
</body>
</html>
