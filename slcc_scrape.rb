# require 'pry'
# require 'nokogiri'
# require 'open-uri'
# require 'rubygems'
# require 'mechanize'

# agent = Mechanize.new

# page = agent.get('https://www.google.com/')

# pp page

# google_form = page.form('f')

# google_form.q = 'ruby mechanize'

# binding.pry
# page.links.each do |link|
#   puts link.text
# end 

# page = agent.page.link_with(:text => 'News').click
# binding.pry
# doc = Nokogiri::HTML(open())

# requiring gems
require 'rubygems'
require 'mechanize'
require 'pry'
username = "mwhita14"
password = "P0wder??" 

#setting agent 
agent = Mechanize.new
#setting login alias 
agent.user_agent_alias = 'Windows Chrome'
#avoiding auth ????
agent.add_auth('https://www.slcc.edu/', username, password)

#getting page and setting it to page var
page = agent.get('http://www.slcc.edu/')
#listing links
page.links.each do |link|
  puts link.text 
end
#clicking on mySLCC
page = agent.page.link_with(:text => 'MySLCC', :href => 'https://my.slcc.edu').click
#filling out login form 
form = page.forms.first
form['username'] = username
form['password'] = password
page = agent.submit(form)
pp page
# page = agent.get('https://auth.slcc.edu:9443/authenticationendpoint/login.do?commonAuthCallerPath=%252Fcas%252Flogin&forceAuth=false&passiveAuth=false&tenantDomain=carbon.super&sessionDataKey=b69f175c-1e7b-4567-bb71-d80634e97218&relyingParty=LuminisUserPortal&type=cassso&sp=LuminisUserPortal&isSaaSApp=false&authenticators=BasicAuthenticator:LOCAL')


# page = agent.submit(form)
# exit_page = agent.
# binding.pry
# pp page
# slcc_un_form = page.form('../commonauth')
# slcc_un_form.q = 'mwhita14'
# google_form = page.form('f')
# google_form.q = 'ruby mechanize'
# page = agent.submit(google_form)
# pp page
