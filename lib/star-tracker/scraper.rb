require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper 
    def initialize
        @base_url = "https://www.fantasypros.com"
    end 

    def scrape_all_players
        doc = Nokogiri::HTML(open(@base_url + "/nba/rankings/ros-overall.php"))
        doc.search(".player-label").each do |player|
            name = player.search(".player-name").text
            info = player.search("small:not(.player-status-abbrev)").text
            url = player.search("a").map {|el| el.attribute('href').value}.reject {|n| n == '#'}
            url_to_string = url.join("")
            if name != ""
            player = Player.new(name, info, url_to_string)
            end 
        end
    end

    def scrape_player_updates(player)
        doc = Nokogiri::HTML(open(@base_url + player.url))
        doc.search("b").remove
        player.updates = doc.search(".content p").text
    end 
end 