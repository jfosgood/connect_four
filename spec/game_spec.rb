# game class should:
# - have players, current_player, other_player, board,  attr
# - be initialized with two players and a board 
# - have #switch_players method
# - have #solicit_move method that asks player for col number to drop piece 
# - have #play_move method that takes col number and current player 'color'
#     - uses Board.get_available_cell(col) to update val at correct coord
# - have #game_start method with greeting
# - have #game_over method that returns :winner, :draw, or nil
# - have #game_over_message that prints appropriate message when game is over 
# - have #play method with game loop
#     - solicit current player move
#     - plays move 
#     - checks winning poss for game over 
#     - prints board
#     - prints game over message or switches players and repeats 


