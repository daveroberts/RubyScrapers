require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = 'http://steamcommunity.com/id/iamdave/games?tab=all'
doc = Nokogiri::HTML(open(url))
nodes = doc.css('h4')
nodes.each do |item|
	File.open("steam_games.txt", 'a') {|f| f.write("\n" + item.text) }
end
