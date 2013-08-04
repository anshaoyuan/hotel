require_relative 'bill'
class Cus_service
	@@hotels = {}
	REGULER ="Regular"
	REWARDS = "Rewards"
	def self.add_hotel(hotel)
		@@hotels[hotel.position.to_sym] = hotel
	end
	def self.get_hotels
		@@hotels
	end
	def self.get_cheapest_hotel(customer)
		bills = Bills.new
		bills.bill_list = get_bills(customer)
		bills.get_highest_hotel
	end
	private 
	def self.get_bills(customer)
		if customer.customer_type.eql?(REGULER)
			get_bills_with_each_hotel{ |v| v.weekday_rates_regular * customer.weekday_tatal + v.weekend_rates_regular * customer.weekend_total}
		else
			get_bills_with_each_hotel{|v|  v.weekday_rates_rewards * customer.weekday_tatal + v.weekend_rates_rewards * customer.weekend_total}
		end
	end

	def self.get_bills_with_each_hotel
		bill_list = []
		@@hotels.each do |k,v|
			price_total = yield v 
			bill = Bill.new(v,price_total)
			bill_list << bill
		end
		bill_list
	end
end