<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Clickable Bat and Ball</title>
    <style>
      body {
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction:column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        background-color: #d9fdd3;
        font-family: Arial, sans-serif;
      }

      .container {
        display: flex;
        gap: 40px; /* Space between the two boxes */
      }

	  h1 {
        font-size: 2.5rem;
        color: #007844; /* Dark green */
        margin-bottom: 10px;
      }

      .box {
        width: 150px;
        height: 150px;
        background-color: green;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 15px;
        box-shadow: 0px 6px 8px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        text-decoration: none; /* Remove link underline */
        color: white; /* Text color for accessibility */
        font-size: 1.2rem;
        font-weight: bold;
      }

      .box:hover {
        transform: scale(1.1); /* Slightly enlarge the box on hover */
        box-shadow: 0px 8px 12px rgba(0, 0, 0, 0.3); /* Enhance shadow on hover */
      }

      .box span {
        font-size: 3rem; /* Adjust the size of the emoji */
      }

      button {
        background-color: green;
        border: none;
        font-size: 4rem;
        width: 100%;
      }
    </style>
  </head>
  <body>
  	<h1>You've Won the Toss!!</h1>
    <div class="container">
      <form action="Register" method="post" class="box">
        <input type="hidden" name="choose" value="Bat" />
        <input type="hidden" name="action" value="choose" />
        <button type="submit">🏏</button>
      </form>

      <form action="Register" method="post" class="box">
        <input type="hidden" name="choose" value="Ball" />
        <input type="hidden" name="action" value="choose" />
        <button type="submit">🥎</button>
      </form>
    </div>
  </body>
</html>
	