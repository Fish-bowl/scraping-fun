

require 'pry'
require 'mechanize'
require 'rubygems'

numbers_value = "541620 326191 562991 423850"
narrow_value = "bathroom toilet outhouse portapotty restroom"

agent = Mechanize.new
agent.user_agent_alias = "Mac Firefox"

page = agent.get('https://www.fbo.gov/?s=opportunity&mode=list&tab=list')

select.value = select_list.option_with(:value => /1|2/).each do |field|
  field_value = '100'
end 
binding.pry
form = page.form("search_filters")
main_form = form.fields.first.value=narrow_value
button = form.button_with(:value => "search")
agent.submit(form, button)
page.links.each do |link|
  puts link.text
end 
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
