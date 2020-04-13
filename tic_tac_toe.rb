class Game

    def initialize
        @@turn_count = 1
        self.create_players
        self.create_board
        self.display_board
        self.play_game
    end

    def create_players
        puts
        puts "Player 1, please enter your name:"
        puts
        name1 = gets.chomp
        $player1 = Player.new(name1)
        puts "Player 2, please enter your name:"
        puts
        name2 = gets.chomp
        $player2 = Player.new(name2)
        puts "Let's play...."
        puts
        puts "TIC TAC TOE!!!"
        puts
    end

    def create_board #creates blank board... sets game_over to false
        @@board = [[" "," "," "],
                  [" "," "," "],
                  [" "," "," "]]
        @game_over = false
    end

    def display_board #checks if the game is over
        puts
        puts @@board[0].join(" | ")
        puts "----------"
        puts @@board[1].join(" | ")
        puts "----------"
        puts @@board[2].join(" | ")
        puts
        self.game_over?
    end

    def game_over?
        if (@@board[0][0] == @@board[0][1] && @@board[0][0] == @@board[0][2] && @@board[0][2] != " ") ||
            (@@board[1][0] == @@board[1][1] && @@board[1][0] == @@board[1][2] && @@board[1][2] != " ") ||
            (@@board[2][0] == @@board[2][1] && @@board[2][0] == @@board[2][2] && @@board[2][2] != " ") ||
            (@@board[0][0] == @@board[1][0] && @@board[0][0] == @@board[2][0] && @@board[2][0] != " ") ||
            (@@board[0][1] == @@board[1][1] && @@board[0][1] == @@board[2][1] && @@board[2][1] != " ") ||
            (@@board[0][2] == @@board[1][2] && @@board[0][2] == @@board[2][2] && @@board[2][2] != " ") ||
            (@@board[0][0] == @@board[1][1] && @@board[0][0] == @@board[2][2] && @@board[2][2] != " ") ||
            (@@board[0][2] == @@board[1][1] && @@board[0][2] == @@board[2][0] && @@board[2][0] != " ") ||
            @@turn_count == 10
            @game_over = true
        end
    end

    def play_game
        until @game_over do
            if (@@turn_count % 2 == 0)
                puts "#{$player1.name}, it is your turn.  Where would you like to go?"
                position = gets.chomp.to_i
                $player1.change_board(position)
                @@turn_count += 1
                display_board
            else
                #player2 turn
                puts "#{$player2.name}, it is your turn.  Where would you like to go?"
                position = gets.chomp.to_i
                $player2.change_board(position)
                @@turn_count += 1
                display_board
            end
        end
        puts
        puts "GAME OVER!"
    end

end

class Player < Game

    attr_accessor :name, :symbol

    def initialize(name)
        self.name = name #assigns player's name
        puts
        puts "What would you like your symbol to be, #{self.name}?"
        self.symbol = gets.chomp
    end

    def already_taken
        puts "You cannot go here.  Please choose a new space."
                position = gets.chomp.to_i
                self.change_board(position)
    end

    def change_board(position)
        case
        when position == 1
            if (@@board[0][0] == " ")
                @@board[0][0] = "#{@symbol}"
            else
                self.already_taken
            end
        when position == 2
            if (@@board[0][1] == " ")
                @@board[0][1] = "#{@symbol}"
            else
                self.already_taken
            end
        when position == 3
            if @@board[0][2] == " "
                @@board[0][2] = "#{@symbol}"
            else
                self.already_taken
            end
        when position == 4
            if @@board[1][0] == " "
                @@board[1][0] = "#{@symbol}"
            else
                self.already_taken
            end
        when position == 5
            if @@board[1][1] == " "
                @@board[1][1] = "#{@symbol}"
            else
                self.already_taken
            end
        when position == 6
            if @@board[1][2] == " "
            @@board[1][2] = "#{@symbol}"
            else
                self.already_taken
            end
        when position == 7
            if @@board[2][0] == " "
            @@board[2][0] = "#{@symbol}"
        else
            self.already_taken
        end
        when position == 8
            if @@board[2][1] == " "
                @@board[2][1] = "#{@symbol}"
            else
                self.already_taken
            end
        when position == 9
            if @@board[2][2] == " "
                @@board[2][2] = "#{@symbol}"
            else
                self.already_taken
            end
        end
    end

end

game1 = Game.new