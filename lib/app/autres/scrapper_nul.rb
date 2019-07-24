require 'open-uri'

Dotenv.load('.env')

class Scrapper

	attr_accessor :town, :town_hall_url, :half_url, :email_mairie
	
	def initialize(town,email_mairie)
		@town_hall_url = town_hall_url
		
		@town = city
		@half_url = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")).xpath('//a[contains(@href, "./95/")]')
	end
	
	def gets_townhall_email
		@email_mairie = Nokogiri::HTML(open("#{town_hall_url}")).xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
		
	end


	def get_townhall_urls
		slice_url = @half_url.map { |link| link['href'] }
		slice_url.each do |i|
			i.slice!(0) 
		end
		town_hall_url = slice_url.map { |j| "http://annuaire-des-mairies.com#{j}"}
		return town_hall_url
	end

	def city
		city = @half_url.map { |string| string.text  }
		#puts name_mairie
		return city
	end

	def mailing_list
		email_list = []

		@town_hall_url.each do |i|
		@email_mairie = get_townhall_email(i)
		email_list << @email_mairie
		end

		annuaire = []
		city.each do |j|
		result = { j => email_list[city.index(j)]}
		annuaire << result
		
		end
		puts annuaire
	end


#	def perform
#		half_url = get_url_data

	#	town_hall_url = get_townhall_urls(half_url)

	#	town = city(half_url)

	#	annuaire = mailing_list(town_hall_url,town)
	#end
end