require 'net/http'
require 'json'
require 'rubygems'

def get_data_from_api
	
	request_string = "https://controllerdata.lacity.org/resource/f3p3-3myx.json"
	
	sample_uri = URI(request_string) #opens a portal to the data at that link
	sample_response = Net::HTTP.get(sample_uri) #go grab the data in the portal
	sample_parsedResponse = JSON.parse(sample_response) #makes data easy to read
	
	#comes back as an array filled with hashes
	answer_array = sample_parsedResponse.map do |each_department|
		department_title = each_department["department_title"]
		female_average_salary = each_department["female_average_salary"]
		male_average_salary = each_department["male_average_salary"]
		"#{department_title} - The female average salary is #{female_average_salary} and the male average salary is #{male_average_salary}."
	end
	
	answer_array
end




def format_request_and_call_api(search_term)
	new_search_term = search_term.gsub(" ", "+")
	request_string = "http://api.giphy.com/v1/gifs/search?q=#{new_search_term}&api_key=dc6zaTOxFJmzC"
	
	sample_uri = URI(request_string) #opens a portal to the data at that link
	sample_response = Net::HTTP.get(sample_uri) #go grab the data in the portal
	sample_parsedResponse = JSON.parse(sample_response) #makes data easy to read
	# data comes back as a hash with info stored in key :data as an array
	data = sample_parsedResponse["data"]
	# data is now an array containing hashes of the gifs
	data.sample["images"]["fixed_height"]["url"]
end





