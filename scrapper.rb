require 'open-uri'
require 'nokogiri'

# www.techmaker.tv

cities        = ['denver', 'albuquerque']
search_terms  = ['ruby']

cities.each do |city|
  search_terms.each do |search_term|

    # url = "https://albuquerque.craigslist.org/search/sof"
    url = "https://#{city}.craigslist.org/search/cpg?query=#{search_term}&is_paid=all"

    document = open(url)

    content = document.read

    parsed_content = Nokogiri::HTML(content)

    puts "=========================================="
    puts "   #{city} - #{search_term}"
    puts "=========================================="

    # puts parsed_content.css('.content').css('.rows').css('.hdrlnk').first.inner_text

    parsed_content.css('.content').css('.result-row').each do |row|
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
  end
end


# parsed_content.css('.rows').each do |row|
#   title = row.css('.result-title').inner_text
#   time = row.css('.time').first.attribute["datetime"].value
#   puts title
#   puts time
# end
