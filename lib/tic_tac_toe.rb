require 'pry'
class TicTacToe

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        player_input = input.to_i 
        index_number = player_input - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " "
            false
        else
            true
        end


    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn
        puts "Please enter a number (1-9):"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
          token = current_player
          move(index, token)
          display_board
        else
          turn
        end
      end

    def turn_count
        @board.count{|token| token =="X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
          if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
            return combo
          end
        end
    end  

    def full?
        @board.all?{|square| square != " " }
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || full? || draw?
    end

    def winner
      if won?
        @board[won?[0]]
      end
    end

    def play
        until over?
            turn
            draw?
        end
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end