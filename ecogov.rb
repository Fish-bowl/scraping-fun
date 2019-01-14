
#requiring gems
require 'pry'
require 'mechanize'
require 'rubygems'
require 'csv'
#setting search terms
numbers_value = "541620 326191 562991 423850"
narrow_value = "bathroom toilet outhouse portapotty restroom"
#creating new instance of mechanize 
agent = Mechanize.new
agent.user_agent_alias = "Mac Firefox"
#setting page
page = agent.get('https://www.fbo.gov/?s=opportunity&mode=list&tab=list')


# select_list.option_with(:value => "^0-9.").each do |field|
#   field_value = '100'
# end 
#setting form for the search terms 
form = page.form("search_filters")
#setting values
main_form = form.fields.first.value=narrow_value
#setting submit button
button = form.button_with(:value => "search")
#submitting form 
agent.submit(form, button)
page.links.each {|link| puts link}
page = agent.page.link_with(:text => '»') 

CSV.open("contracts.csv" "w") do |csv|
  csv << []
  csv << []
end 

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
