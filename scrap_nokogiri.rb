require 'nokogiri'

file = File.open('steve_jobs.htm')
html = Nokogiri::HTML file

name = html.at_css('body').text.strip
# html.css('body').text.strip
