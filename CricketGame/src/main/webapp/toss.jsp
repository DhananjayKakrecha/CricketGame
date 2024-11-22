<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Coin Flip</title>
    <style>
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #d9fdd3;
        margin: 0;
      }
      .container {
        display: flex;
        align-items: center;
        gap: 50px;
      }
      .coin {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        background: gold;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 18px;
        font-weight: bold;
        color: black;
        text-transform: uppercase;
        animation: none;
      }
      .coin.spin {
        animation: spin 2s linear; /* Longer spin duration */
      }
      @keyframes spin {
        0% {
          transform: rotateY(0deg);
        }
        100% {
          transform: rotateY(1080deg); /* Three full rotations */
        }
      }
      .radio-button {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        border: 2px solid #ccc;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        text-transform: capitalize;
      }
      .radio-button.selected {
        border-color: blue;
        background-color: lightblue;
      }
      button {
        margin-top: 20px;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <form id="coinForm" action="Register" method="POST">
      <div class="container">
        <div class="radio-button" id="heads" data-value="Heads">Heads</div>
        <div class="coin" id="coin">Coin</div>
        <div class="radio-button" id="tails" data-value="Tails">Tails</div>
      </div>
      <input type="hidden" name="action" value="toss" />
      <input type="hidden" name="choice" id="choice" value="" />
      <button type="button" id="flipButton">Flip</button>
    </form>

    <script>
      const headsDiv = document.getElementById("heads");
      const tailsDiv = document.getElementById("tails");
      const coinDiv = document.getElementById("coin");
      const flipButton = document.getElementById("flipButton");
      const choiceInput = document.getElementById("choice");

      let selectedChoice = "";

      // Handle selection of Heads or Tails
      headsDiv.addEventListener("click", () => {
        selectedChoice = "Heads";
        choiceInput.value = selectedChoice;
        headsDiv.classList.add("selected");
        tailsDiv.classList.remove("selected");
      });

      tailsDiv.addEventListener("click", () => {
        selectedChoice = "Tails";
        choiceInput.value = selectedChoice;
        tailsDiv.classList.add("selected");
        headsDiv.classList.remove("selected");
      });

      // Handle coin flip animation
      flipButton.addEventListener("click", () => {
        if (!selectedChoice) {
          alert("Please select Heads or Tails first!");
          return;
        }
        coinDiv.classList.add("spin");
        setTimeout(() => {
          coinDiv.classList.remove("spin");
          document.getElementById("coinForm").submit(); // Submit the form after animation
        }, 2000); // Match the animation duration
      });
    </script>
  </body>
</html>

    