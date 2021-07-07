class CLI
    def call
        greeting
        sleep(1)
        puts "Loading data, this might take a second..."
        Scraper.new.scrape_all_players
        puts "Done! Here are today's player rankings:"
        puts ""
        Players.print_all_rankings
        sleep(1)
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
            puts "Enter the number of the player you would like info on, type 'list' to return to the rankings, or type 'exit'."
            input = gets.strip.downcase

            if input.to_i > 0
                Players.all[input.to_i - 1].print_player_updates
            elsif input == 'list'
                puts ""
                list_players
            elsif input == 'exit'
                puts "=======================".colorize(:red)
                goodbye
            else 
                puts "Not sure what you want, type 'list' or 'exit'"
            end
        end
    end  
    
    def list_players
        Players.print_all_rankings 
    end 

    def goodbye 
        puts "Thanks for stopping by, and good luck with your matchups! See you tomorrow!"
        puts ""
    end 
 end