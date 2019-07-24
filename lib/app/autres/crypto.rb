require 'open-uri'

Dotenv.load('.env')

class Crypto

attr_accessor :page , :crypto_name_array , :crypto_price_array, :crypto_array
	
	def initialize

		@page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   		
		
		#Création de l'array final (contenant les hashes)	
		@crypto_array = []
		@crypto_name_array = @page.xpath('//*[@id]/td[3]').map { |string| string.text  }
		@crypto_price_array = @page.xpath('//*[@id]/td[5]/a').map { |price| price.text  }
	end

	def crypto_generator
		@crypto_name_array.each do |symbol|
		result = { symbol => @crypto_price_array[@crypto_name_array.index(symbol)] }
		    @crypto_array << result
		 end
		  return @crypto_array
	end


	def end		
		puts  "Vous avez collectés #{crypto_array.size} entrées"		
		puts @crypto_array
	end
end