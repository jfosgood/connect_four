#board should:
# -have 6 rows, 7 columns by default
#     - readable attrs
# -be full of cell objects
# -have a #get_cell(x,y) method that returns instance of cell at x,y
#     - should return nil if x or y is out of range of board
# -have a #drop_marker(col, val) method that inserts value at lowest empty poss in col
# -have #get_winning_poss(x, y)
#     - uses #get_cell to return list of all combos of 4 that include given coords
# -have #print_board method that prints visual of cells with values