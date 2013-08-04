require 'date'
require_relative 'customer_service'
class Customer
	attr_reader :customer_type, :weekend_total  ,:weekday_tatal 

	def initialize(customer_type,*dates)
		@customer_type = customer_type
		@weekend_total = 0
		dates.each do |date|
			wday = DateTime.parse(date).strftime("%a")
			if(wday.eql?("Sun") || wday.eql?("Sat"))
				@weekend_total += 1
			end
		end
		@weekday_tatal = dates.length - @weekend_total
	end
	def find_cheapest_hotel
		Cus_service.get_cheapest_hotel(self)
	end

end