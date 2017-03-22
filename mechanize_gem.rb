require 'mechanize'
require 'CSV'

# search terms
search_terms = ['steve jobs', 'henry ford', 'andrew carnegie', 'benjamin franklin']

# set up mechanize
agent = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

# set up page
page = agent.get('https://www.wikipedia.org/')
search_form = page.form(:action => "//www.wikipedia.org/search-redirect.php")

search_terms.each do |term|
  search_form.search = term
  results = agent.submit(search_form, search_form.button('go'))
  html_results = Nokogiri::HTML results.body
  name = html_results.at_css('#firstHeading').text
  bday = html_results.at_css('.bday').text
  dday = html_results.at_css('.dday').text

  # puts "#{name} was born on #{bday} and died on #{dday}."
  CSV.open('life-data.csv', 'a+') do |csv|
    csv << [name, bday, dday]
  end
  delay_time = rand(61)
  sleep(delay_time)
  puts "#{name} was just added to CSV!"
end

# search_form.search = 'Steve Jobs'
# results = agent.submit(search_form, search_form.button('go'))
# html_results = Nokogiri::HTML results.body
# puts html_results.at_css('#firstHeading').text
