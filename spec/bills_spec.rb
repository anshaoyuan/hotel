require 'spec_helper'
describe Bills do 
	before(:all) do 
			@Lakewood  = Hotel.new("Lakewood",3,
			weekday_rates_regular:110,
			weekday_rates_rewards:80,
			weekend_rates_regular:90,
			weekend_rates_rewards:80)
			@Bridgewood = Hotel.new("Bridgewood",4,
			weekday_rates_regular:160,
			weekday_rates_rewards:110,
			weekend_rates_regular:60,
			weekend_rates_rewards:50)
			@Ridgewood = Hotel.new("Ridgewood",5,
			weekday_rates_regular:220,
			weekday_rates_rewards:100,
			weekend_rates_regular:150,
			weekend_rates_rewards:40)
			@price_min = 1000
			@price_max = 2000

			bill_Lakewood = Bill.new(@Lakewood,@price_min)
			bill_Bridgewood = Bill.new(@Bridgewood,@price_max)
			bill_Ridgewood = Bill.new(@Ridgewood,@price_min)
			@bills = Bills.new

			@bills.bill_list = [bill_Lakewood,bill_Bridgewood,bill_Ridgewood]
	end
	it "get the cheapest hotels from collection" do
			list_min_price = @bills.get_min_price_list
			list_min_price.size.should == 2
			list_min_price.each do |bill|
				bill.price_total.should == @price_min
			end

	end
	it "get the hotel with highest rating when two hotel's price is same" do
			@bills.get_highest_hotel.should ==  @Ridgewood
	end
end