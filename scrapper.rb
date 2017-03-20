require 'open-uri'
require 'nokogiri'

cities        = ['newyork']
search_terms  = ['developer']

# cities.each do |city|
#   search_terms do |terms|
#
#
#   end
# end


# url = "https://albuquerque.craigslist.org/search/sof"
url = "https://newyork.craigslist.org/search/cpg?query=developer&is_paid=all"

document = open(url)

content = document.read

parsed_content = Nokogiri::HTML(content)

# puts parsed_content.css('.content').css('.rows').css('.hdrlnk').first.inner_text

parsed_content.css('.content').css('.rows').each do |row|
  title       = row.css('.hdrlnk').inner_text
  link        = row.css('.hdrlnk').first.attributes["href"].value
  posted_at   = row.css('time').first.attributes["datetime"].value
  neighe_elem = row.css('.pnr').css('small')

  if neighe_elem.any?
    neighborhood = neighe_elem.first.inner_text.strip
  else
    neighborhood = ''
  end

  puts "#{title} #{neighborhood}"
  puts "Link: #{link}"
  puts "Posted at #{posted_at}"
  puts '-------------------------------------'
end

# parsed_content.css('.rows').each do |row|
#   title = row.css('.result-title').inner_text
#   time = row.css('.time').first.attribute["datetime"].value
#   puts title
#   puts time
# end
