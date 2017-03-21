require 'mechanize'

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
  puts html_results.at_css('#firstHeading').text

end

# search_form.search = 'Steve Jobs'
# results = agent.submit(search_form, search_form.button('go'))
# html_results = Nokogiri::HTML results.body
# puts html_results.at_css('#firstHeading').text
