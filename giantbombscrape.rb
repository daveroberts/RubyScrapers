require 'rubygems'
require 'nokogiri'
require 'open-uri'

(3..34).each do |p|
	url = 'http://www.giantbomb.com/xbox-360-controller-support-for-pc/92-2465/?page=' + p.to_s
	doc = Nokogiri::HTML(open(url))
	nodes = doc.xpath('//*[(@id = "wikid-list-games^2465")]//td[(((count(preceding-sibling::*) + 1) = 3) and parent::*)]//a')
	nodes.each do |item|
		File.open("360_supported_games.txt", 'a') {|f| f.write("\n" + item.text) }
	end
	sleep(10)
end
