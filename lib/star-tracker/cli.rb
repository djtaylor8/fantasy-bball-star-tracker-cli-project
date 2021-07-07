class CLI
    def call
        greeting
        sleep(2)
        puts "Loading data, this might take a second..."
        Scraper.new.scrape_all_players
        puts "Done!"
        puts ""
        sleep(0.5)
        choose_rankings_to_print
        sleep(2)
        puts ""
        menu
    end
    
    def greeting 
        puts "=============================".colorize(:blue)
        puts ""
        puts "Welcome to the Fantasy Basketball Star Tracker"
        puts ""
        puts "Check out the latest rankings for your players and read the most recent updates about their status here."
        puts ""
        puts "=============================".colorize(:blue)
    end
    
    def menu 
        input = nil 
        while input != 'exit'
            puts "Enter the number of the player you would like more info on, type 'list' to return to the rankings, or type 'exit'."
            input = gets.strip.downcase

            if input.to_i > 0
                Players.all[input.to_i - 1].print_player_updates
            elsif input == 'list'
                puts ""
                choose_rankings_to_print
            elsif input == 'exit'
                puts "=======================".colorize(:blue)
                goodbye
            else 
                puts "Not sure what you want, type 'list' or 'exit'"
            end
        end
    end
    
    def choose_rankings_to_print
        puts "Enter the number of player rankings you would like to see (1-371): "
        input = gets.strip.to_i 
        puts "Here are the top #{input} rankings for today..."
        puts "" 
        Players.print_all_rankings(input)
        puts ""
    end

    def goodbye 
        puts "Thanks for stopping by, and good luck with your matchups!"
        puts ""
    end 
 end