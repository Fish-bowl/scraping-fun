
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
page = agent.submit(form, button)

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
# page.links.each do |link|
#   if link.include?('Department')
#     puts link 
#   else 
#     puts 'no link'
#   end
# end  

# doc = Nokogiri::HTML(open(agent.page.uri))
@contracts = page.css('table')[6]

doc = Nokogiri::XML(@contracts, <table>) do |config|
  config.strict.noblanks
end 

binding.pry

def creator 
  @contracts.each do |contract|
    puts '*' * 20
    puts contract.split('\n')
    puts '*' * 20
  end 
end 

puts '-' * 50

# binding.pry
creator
pp @contracts


puts "-" * 50
