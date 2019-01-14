require 'pry'
require 'mechanize'
require 'rubygems'

numbers_value = "541620 326191 562991 423850"
narrow_value = "bathroom toilet outhouse portapotty restroom"

agent = Mechanize.new
agent.user_agent_alias = "Mac Firefox"

page = agent.get('https://www.fbo.gov/?s=opportunity&mode=list&tab=list')

# binding.pry
# select = page.form.field_with(:name => 'setPerPage').options[3].select

form = page.form("search_filters")
main_form = form.fields.first.value=narrow_value
form.submit
# binding.pry
page.links.each do |link|
  puts link.text
end 
# binding.pry
# pretty = pp page
pp links
# main_form.value = "541620 326191 562991 423850".submit
# page = agent.submit(main_form)
# binding.pry
# search_field.values = '541620'
# form.q = '541620'
# pp form 
# pp page
