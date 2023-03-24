# TicTacToe game

This is a simple command line game of TicTacToe built using Ruby. The game has two modes, single player against a computer and two-player mode.

## How to play

To play, simply run the tic_tac_toe.rb file in a terminal:

```bash
ruby tic_tac_toe.rb
```


The game will alternate turns between

The game will ask you to choose the type of game you want to play: human vs. human, human vs. computer or computer vs. computer.

If you choose computer vs. computer, you will be prompted to enter the computer's difficulty option.

When the game starts, the current player will be prompted to choose a cell to place their marker. To choose a cell, enter the number of the cell (1-9). The cell numbers are arranged as follows:
```markdown
1 | 2 | 3
---------
4 | 5 | 6
---------
7 | 8 | 9
```

The game will alternate turns between the players until one of them wins or the board is full. If a player wins, the game will display a message with the winner's name. If the board is full and no player has won, the game will end in a tie.

## Implementation details

The game is implemented in Ruby. There are four classes:

- Board: represents the game board and its state.
- Player: represents a human or computer player, with it's marker (X or O).
- ComputerPlayer: a subclass of Player that implements a simple AI algorithm to play the game.
- HumanPlayer: a subclass of Player that implements a simple prompt get the player move.

The _Board_ class contains methods to display the board, check for the winner and detect available moves.

The _Player_ class has a move method that prompts the user to enter a cell number and updates the board accordingly.

The _ComputerPlayer_ class overrides the move method to implement a simple AI algorithm based on a minimax approach. The difficulty of the AI can be set to "easy", "medium" or "hard", which affects the depth of the search tree in the minimax algorithm.

The main  logic is in the _tic_tac_toe.rb_ file. It contains the game loop and the logic to prompt the user for input and display messages.