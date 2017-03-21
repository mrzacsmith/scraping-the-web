require 'mechanize'
agent = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

page = agent.get('https://www.wikipedia.org/')

search_form = page.form(:action => "//www.wikipedia.org/search-redirect.php")

pp search_form
