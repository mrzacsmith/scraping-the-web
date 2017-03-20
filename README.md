##Scraping the Web using Ruby

####Commands:
+ ```irb``` >> start the interactive ruby
+ ```require 'open_uri'```
+ require 'nokogiri'
####Assuming both come back true, you are good to continue, else do 'gem install <gem name>'
+ open('URL')
+ doc = _ (sets the last item to doc)
+ content = doc.read
+ parsed_content = Nokogiri::HTML(content)
+ parsed_content.css('.content')
+ parsed_content.css('.content').css('.rows')
+ parsed_content.css('.content').css('.rows').css('.hdrlnk')
+ parsed_content.css('.content').css('.rows').css('.hdrlnk').first
+ parsed_content.css('.content').css('.rows').css('.hdrlnk').first.class  
+ parsed_content.css('.content').css('.rows').css('.hdrlnk').first.class.instance_methods.sort
+ parsed_content.css('.content').css('.rows').css('.hdrlnk').first.inner_text
+ parsed_content.css('.content').css('.rows').css('.hdrlnk').first.inner_html
+ parsed_content.css('.content').css('.rows').css('.hdrlnk').first
+ ```parsed_content.css('.content').css('.rows').each do |row|
      puts "#{row.css('.hdrlnk').first.inner_text}"
      end```

+ 
