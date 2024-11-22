<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cricket Decision</title>
    <style>
      body {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
        background-color: #d9fdd3; /* Light green */
        font-family: Arial, sans-serif;
      }

      h1 {
        font-size: 2.5rem;
        color: #007844; /* Dark green */
        margin-bottom: 10px;
      }

      h3 {
        font-size: 1.8rem;
        color: #444;
        margin-bottom: 20px;
      }

      .timer {
        font-size: 2rem;
        color: orange; /* Red for the timer */
        margin-bottom: 20px;
      }

      form {
        display: none; /* Form is hidden */
      }
    </style>
  </head>
  <body>
  	<% String role = (String) session.getAttribute("role");
  		role.strip();
		
  		String tossWin = (String) session.getAttribute("tossWin");
  		tossWin.strip();
  		
  		String npage;
  		
  		if(role.equals("Bat First")){
  			npage = "cricketplay.jsp";
  		}else{
  			npage = "cricketball.jsp";
  		}
  	%>
  
    <h1><%= tossWin%></h1>
    <div class="timer"><span id="timer">10</span></div>

    <!-- Form to be submitted automatically -->
    <form id="autoSubmitForm" action="<%= npage%>" method="POST">
    	<input type="submit">
    </form>

    <script>
      // Timer functionality
      const timerElement = document.getElementById("timer");
      const form = document.getElementById("autoSubmitForm");
      let countdown = 10; // Start from 10 seconds

      const timerInterval = setInterval(() => {
        countdown--; // Decrease the timer
        timerElement.textContent = countdown; // Update the timer on the page

        if (countdown === 0) {
          clearInterval(timerInterval); // Stop the timer
          form.submit(); // Automatically submit the form
        }
      }, 1000); // Update every second
    </script>
  </body>
</html>
    