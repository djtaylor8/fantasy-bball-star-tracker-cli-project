require 'pry'
require 'open-uri'
require 'nokogiri'
require 'colorize'

class Player 
    attr_accessor :name, :info, :url, :updates 
    @@all = []

    def initialize(name, info, url, updates = nil)
        @name = name 
        @info = info
        @url = url 
        @updates = updates 
        @@all << self 
    end

    def self.all 
        @@all 
    end

    def check_for_updates
        if @updates == nil 
            Scraper.new.scrape_player_updates(self)
        end 
    end
    

end 