require 'rubygems'
require 'mechanize'
require 'HTTParty'
require 'colorize'
require 'pry'

# def main 
#   puts "Welcome to the scraper".colorize(:red)
#   puts "enter the url you would like to scrape".colorize(:red)
#   input = $stdin.gets.strip 
#   @og_url = "https://www." + input 
#   puts @og_url
# end 

# class Scraper 
#   doc = Nokogiri::HTML(open(og_url))
#   form = doc.css_at("f")
#   puts doc
#   puts "-" * 30
#   puts for
# end 

class Scraper 

  attr_accessor :parse_page

  def initialize 
    doc = HTTParty.get("https://www.fbo.gov/index.php?s=opportunity&mode=list&tab=list&tabmode=list&pp=100")
    @parse_page ||= Nokogiri::HTML(doc)
    puts 'Welcome to the scraper'.colorize(:purple)
    puts "this is a practice session for all advanced nokogiri"
  end

  def get_content 
    content = item_container.xml(<table> </table>)
  end 


  private

  def item_container
    parse_page.css('list').children
  end 

  scraper = Scraper.new
  content = scraper.get_content
  binding.pry
  (content).each do |index|
    puts "--- index: #{index +1} ---"
    puts content
  end 
end 
# main
