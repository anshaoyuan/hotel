class Bill
	attr_reader :hotel,:price_total
	def initialize(hotel,price_total)
		@hotel , @price_total = hotel ,price_total
	end
end
class Bills
	attr_accessor :bill_list 
	include Enumerable
	def each
		@bill_list.each do |bill|
			yield bill
		end
	end

	def get_min_price_list
		min_price_list = []
		list = @bill_list.sort_by { |bill|  bill.price_total }
		min_price = list[0].price_total
		list.each do |bill|
			break if bill.price_total != min_price
			min_price_list << bill
		end
		min_price_list

	end

	def get_highest_hotel
		@bill_list = get_min_price_list
		list = @bill_list.sort_by { |bill|  bill.hotel.rate }
		list.last.hotel
	end
end