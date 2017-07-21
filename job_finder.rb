require "httparty"
require "nokogiri"


response = HTTParty.get("https://miami.craigslist.org/search/sof")

dom = Nokogiri::HTML(response.body)

# p dom.css('a.hdrlnk').class

job_titles = []
dom.css('a.hdrlnk').each_with_index do |e,i|
job_titles << (i+1).to_s + "- " + e.content + "\n" + "\t" + e["href"]
end


puts job_titles

search = true
while search == true
	puts "Choose different field if you want to update the search:"
	puts "Admin, Business, Healthcare, Software"
	input = gets.chomp.downcase
	case input
	when "admin"
		response = HTTParty.get("https://miami.craigslist.org/search/ofc")
		dom = Nokogiri::HTML(response.body)
		job_titles = []
		dom.css('a.hdrlnk').each_with_index do |e,i|
		job_titles << (i+1).to_s + "- " + e.content + "\n" + "\t" + e["href"]
		end
		puts job_titles
	when "business"
		response = HTTParty.get("https://miami.craigslist.org/search/bus")
		dom = Nokogiri::HTML(response.body)
		job_titles = []
		dom.css('a.hdrlnk').each_with_index do |e,i|
		job_titles << (i+1).to_s + "- " + e.content + "\n" + "\t" + e["href"]
		end
		puts job_titles
	when "healthcare"
		response = HTTParty.get("https://miami.craigslist.org/search/hea")
		dom = Nokogiri::HTML(response.body)
		job_titles = []
		dom.css('a.hdrlnk').each_with_index do |e,i|
		job_titles << (i+1).to_s + "- " + e.content + "\n" + "\t" + e["href"]
		end
		puts job_titles
	when "software"
		response = HTTParty.get("https://miami.craigslist.org/search/sof")
		dom = Nokogiri::HTML(response.body)
		job_titles = []
		dom.css('a.hdrlnk').each_with_index do |e,i|
		job_titles << (i+1).to_s + "- " + e.content + "\n" + "\t" + e["href"]
		end
		puts job_titles
	else
		puts "We currently unable to connect the Craigslist website"
		search = false
	end
end