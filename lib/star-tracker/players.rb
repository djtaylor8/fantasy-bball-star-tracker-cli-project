require 'pry'
require 'open-uri'
require 'nokogiri'
require 'colorize'

class Players 
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

    def self.print_all_rankings 
        @@all.each_with_index do |player, index|
            puts "#{index + 1}. #{player.name} - #{player.info}"
        end
    end 
    
    def print_player_ranking_and_info 
        puts "#{@name} - #{@info}"
    end

    def print_player_updates
        check_for_updates
        puts "====================".colorize(:green)
        print print_player_ranking_and_info
        puts ""
        puts @updates 
    end

    def check_for_updates
        if @updates == nil 
            Scraper.new.scrape_player_updates(self)
        end 
    end 
end 