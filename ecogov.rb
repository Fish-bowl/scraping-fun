
#requiring gems
require 'pry'
require 'mechanize'
require 'rubygems'
require 'csv'
require 'open-uri'
#setting search terms
numbers_value = "541620 326191 562991 423850"
narrow_value = "bathroom toilet outhouse portapotty restroom"
#creating new instance of mechanize 
agent = Mechanize.new
agent.user_agent_alias = "Mac Firefox"
#setting page
page = agent.get('https://www.fbo.gov/?s=opportunity&mode=list&tab=list')


#setting form for the search terms 
form = page.form("search_filters")
#setting values
main_form = form.fields.first.value=narrow_value
#setting submit button
button = form.button_with(:value => "search")
#submitting form 
agent.submit(form, button)

# def crawl
#   current_url = agent.page.uri.to_s

#   document = open(current_url)
#   content = document.read 
#   @parsed_content = Nokogiri::HTML(content)

#   @unsorted_contracts = Array.new

#   @parsed_content.css('lst-rw').css('tr').each do |tr|
#     @unsorted_contracts << td.text 
#   end 
# end

html = Nokogiri::HTML(open(agent.page.uri))
puts '-' * 50
puts html.at_css("list")
puts "-" * 50
# all_links = page.links.each {|link| puts link}

# page = agent.page.link_with(:text => '»') 

# CSV.open("contracts.csv" "ab") do |csv|
#   csv << []
#   csv << []
# end 

binding.pry


# page.links.each do |link|
#   puts link.text
# end 
# binding.pry

# page.forms.each do |form|
#   puts form
# end
# puts main_form
# main_form.submit
# binding.pry
# binding.pry
# pretty = pp page
# pp page
# main_form.value = "541620 326191 562991 423850".submit
# page = agent.submit(main_form)
# binding.pry
# search_field.values = '541620'
# form.q = '541620'
# pp form 
# pp page
