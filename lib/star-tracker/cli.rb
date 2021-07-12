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
        puts "==========================================================".colorize(:light_blue)
        puts ""
        puts "Welcome to the Fantasy Basketball Star Tracker"
        puts ""
        puts "Check out the latest rankings for your players and read the most recent updates about their status here."
        puts ""
        puts "==========================================================".colorize(:light_blue)
    end
    
    def menu 
        input = nil 
        while input != 'exit'
            puts "Enter the number of the player you would like more info on, type 'list' to return to the rankings, or type 'exit'."
            input = gets.strip.downcase

            if input.to_i > 0
                print_player_updates(input)
            elsif input == 'list'
                puts ""
                choose_rankings_to_print
            elsif input == 'exit'
                puts "==========================================================".colorize(:light_blue)
                goodbye
            else 
                puts "Not sure what you want, type 'list' or 'exit'"
            end
        end
    end
    
    def choose_rankings_to_print
        puts "Whoa, we have access to info on over 350 players!"
        puts ""
        puts "Enter the number of players you would like to see in your list (1-371): "
        input = gets.strip.to_i 
        puts "Here are the top #{input} rankings for today..."
        puts "" 
        print_all_rankings(input)
        puts ""
    end

    def print_player_updates(input)
        player = Player.all[input.to_i - 1]
        player.check_for_updates
        puts "=========================================".colorize(:light_blue)
        puts "#{player.name} - #{player.info}"
        puts ""
        puts player.updates
        puts "" 
    end

    def print_all_rankings(input)
        Player.all.take(input).each_with_index do |player, index|
            puts "#{index + 1}. #{player.name} - #{player.info}"
        end
    end
    
    # example method from portfolio review
    #       def self.print_rankings_alphabetically(input)
    #     self.all.take(input).sort_by{|p| p.name}.each_with_index do |player, index|
    #         puts "#{index + 1}. #{player.name} - #{player.info}"
    #     end
    # end

    def goodbye 
        puts "Thanks for stopping by, and good luck with your matchups!"
        puts ""
    end 
 end