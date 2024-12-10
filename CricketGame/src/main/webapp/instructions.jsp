<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cricket Game Instructions</title>
    <style>
      body {
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        height: 100vh;
        font-family: Arial, sans-serif;
        color: #333;
        background-color: #f4f4f4;
      }

      header {
        text-align: center;
        padding: 10px 0;
        background-color: #007844;
        color: black;
        font-size: 24px;
        font-weight: bold;
      }

      .instructions {
        display: flex;
        flex: 1;
      }

      .left-section,
      .right-section {
        width: 50%;
        padding: 20px;
        overflow-y: auto;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
      }

      .left-section {
        background-color: #c0eba6;
      }

      .right-section {
        background-color: #9edf9c;
      }

      .icon-box {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 120px;
        height: 120px;
        background-color: green;
        border-radius: 50%;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 15px;
        font-size: 64px;
      }

      h2 {
        margin-bottom: 10px;
        color: black;
      }

      ul {
        list-style: square;
        padding-left: 20px;
      }

      ul li {
        font-size: 22px;
        margin-bottom: 10px;
      }

      footer {
        text-align: center;
        padding: 20px 0;
        background-color: #46b442;
        position: absolute;
        bottom: 0;
        width: 100%;
      }

      .start-button {
        padding: 15px 30px;
        font-size: 18px;
        background-color: #078825;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }

      .start-button:hover {
        background-color: #218838;
      }
    </style>
  </head>
  <body>
    <!-- Header Section -->
    <header>Cricket Game Instructions</header>

    <!-- Instructions Section -->
    <div class="instructions">
      <!-- Batting Instructions -->
      <div class="left-section">
        <div class="icon-box">🏏</div>
        <h2>How to Bat</h2>
        <ul>
          <li>Guess a number ranging from (1 to 6).</li>
          <li>
            Ex: You guessed 4 and the opponent(System) will also try to guess
            what you will score!
          </li>
          <li>If the system also guessed the number 4 then you're OUT!!</li>
          <li>
            If the system fails to guess the correct number then you've scored
            that much run for a ball.
          </li>
          <li>You'll get total "18" Balls to play.</li>
          <li>Hit sixes or fours for maximum points!</li>
        </ul>
      </div>

      <!-- Bowling Instructions -->
      <div class="right-section">
        <div class="icon-box">🥎</div>
        <h2>How to Bowl</h2>
        <ul>
          <li>Guess a number ranging from (1 to 6).</li>
          <li>
            Ex: You guessed 2 and the opponent(System) will also try to guess
            what he wants to score!
          </li>
          <li>
            If the system guessed a number "other than 2" then he'll score that
            much run for a ball!!
          </li>
          <li>
            If you guessed the correct number then opponent(System) is OUT!!.
          </li>
          <li>You'll get total "18" Balls to bowl.</li>
        </ul>
      </div>
    </div>

    <!-- Footer Section -->
    <footer>
      <form action="toss.jsp" method="post">
        <button class="start-button" type="submit">Start Your Game</button>
      </form>
    </footer>
  </body>
</html>

