require 'nokogiri'

file = File.open('steve_jobs.htm')
html = Nokogiri::HTML file

output = File.new('steve-story.txt', 'w+')

html.at_css('body').text.strip
name = html.at_css('#firstHeading').text
bday = html.at_css('.bday').text
dday = html.at_css('.dday').text
cause_of_death = html.at_xpath('//a[@title="Pancreatic cancer"]').text

# output.write(name + ' was born ' + bday + ".\n" )
# output.write("He died on " + dday + " from " + cause_of_death)

output.write("\n#{name} was born #{bday} and died on #{dday} from #{cause_of_death}")
