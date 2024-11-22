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
        align-items: center;
        justify-content: center;
        height: 100vh;
        background-color: #d9fdd3; /* Light green background */
        font-family: Arial, sans-serif;
        color: #333;
        overflow: hidden; /* Hide any overflow during the animation */
      }

      h1 {
        font-size: 3rem;
        color: #007844; /* Dark green for the game title */
        margin-bottom: 20px;
      }

      /* Center the form and emojis using flex */
      .form-container {
        display: flex;
        align-items: center; /* Center the items vertically */
        justify-content: center; /* Center the items horizontally */
        position: relative;
        width: 100%; /* Make sure the container takes full width */
        max-width: 800px; /* Maximum width for the form container */
      }

      form {
        background-color: #f7f7f7; /* Light gray background for the form */
        padding: 20px 30px;
        padding-right: 45px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        z-index: 1;
        margin: 0 30px; /* Adds space for the emojis */
        flex-shrink: 0; /* Prevents form from shrinking */
        position: relative; /* For stacking emoji divs correctly */
        opacity: 0; /* Initially hidden */
        animation: fadeInForm 1s forwards; /* Animation to fade in form */
        animation-delay: 1s; /* Delay the form animation */
      }

      label {
        font-size: 1.2rem;
        color: #444;
        display: block;
        margin-bottom: 15px; /* Increased margin to create more space */
      }

      input[type="text"] {
        width: 100%;
        padding: 10px; /* Uniform padding, increased for better spacing */
        font-size: 1rem; /* Larger font size */
        border: 2px solid #007844; /* Border color to match the game title */
        border-radius: 5px;
        margin-bottom: 25px; /* More space below the input field */
      }

      input[type="submit"] {
        background-color: #007844; /* Dark green button */
        color: white;
        padding: 10px 20px;
        font-size: 1rem;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }

      input[type="submit"]:hover {
        background-color: #005b33; /* Slightly darker green on hover */
      }

      /* Animation styling for emojis */
      .emoji {
        position: absolute;
        font-size: 6rem; /* Larger emojis */
        top: 50%;
        transform: translateY(-50%);
        transition: transform 0.5s ease-in-out; /* Smooth transition */
        z-index: 0; /* Ensure emojis are behind the form */
      }

      /* Left emoji animation */
      .left-emoji {
        left: -150px; /* Start off-screen on the left */
        animation-name: slideInFromLeft;
        animation-duration: 1.5s;
        animation-fill-mode: forwards;
        animation-delay: 0.5s; /* Delay left emoji */
      }

      /* Right emoji animation */
      .right-emoji {
        right: -150px; /* Start off-screen on the right */
        animation-name: slideInFromRight;
        animation-duration: 1.5s;
        animation-fill-mode: forwards;
        animation-delay: 2s; /* Delay right emoji */
      }

      /* Keyframes for left emoji to slide in */
      @keyframes slideInFromLeft {
        to {
          left: 5px; /* End position between the left window and the form */
        }
      }

      /* Keyframes for right emoji to slide in */
      @keyframes slideInFromRight {
        to {
          right: 5px; /* End position between the right window and the form */
        }
      }

      /* Keyframes to fade in the form */
      @keyframes fadeInForm {
        to {
          opacity: 1;
        }
      }
    </style>
  </head>
  <body>
    <h1>Cricket Game</h1>

    <div class="form-container">
      <!-- Left-side emoji animation -->
      <div class="emoji left-emoji">🏏</div>

      <!-- Form for username input -->
      <form action="Register" method="POST">
        <label for="username">Enter Your Username:</label>
        <input
          type="text"
          id="username"
          name="username"
          placeholder="Enter username"
          required
        />
        <input type="hidden" name="action" value="register" />
        <input type="submit" value="Start Game" />
      </form>

      <!-- Right-side emoji animation -->
      <div class="emoji right-emoji">🥎</div>
    </div>
  </body>
</html>
    