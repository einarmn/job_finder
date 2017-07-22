require "httparty"
require "nokogiri"

def list(field)
	link = "https://miami.craigslist.org/search/#{field}"
	response = HTTParty.get("#{link}")
	dom = Nokogiri::HTML(response.body)
	job_titles = []
	dom.css('a.hdrlnk').each_with_index do |e,i|
	job_titles << (i+1).to_s + "- " + e.content + "\n" + "\t" + e["href"]
	end
	puts job_titles
end

search = true
while search == true
	puts "Choose different field if you want to update the search:"
	puts "Office, Business, Customer Service, Education, Engineering, Healthcare, Software"
	input = gets.chomp.downcase
	case input
	when "office"
		list("ofc")
	when "business"
		list("bus")
	when "customer service"
		list("csr")
	when "education"
		list("edu")
	when "engineering"
		list("egr")
	when "healthcare"
		list("hea")
	when "software"
		list("sof")
	else
		puts "We currently unable to connect the Craigslist website"
		search = false
	end
end