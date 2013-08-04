require 'spec_helper'
describe Cus_service do
	before(:all) do 
		Lakewood_opt = {
			weekday_rates_regular:110,
			weekday_rates_rewards:80,
			weekend_rates_regular:90,
			weekend_rates_rewards:80
		}
		Bridgewood_opt = {
			weekday_rates_regular:160,
			weekday_rates_rewards:110,
			weekend_rates_regular:60,
			weekend_rates_rewards:50
		}
		Ridgewood_opt = {
			weekday_rates_regular:220,
			weekday_rates_rewards:100,
			weekend_rates_regular:150,
			weekend_rates_rewards:40
		}
		Hotel.new("Lakewood",3,Lakewood_opt)
		Hotel.new("Bridgewood",4,Bridgewood_opt)
		Hotel.new("Ridgewood",5,Ridgewood_opt)
	end
	it "should be Lakewood when customer type is Regular and dates is 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)" do 	
		customer = Customer.new("Regular","16Mar2009","16Mar2009","17Mar2009")
		Cus_service.get_cheapest_hotel(customer).position.should be_eql("Lakewood")
	end
end

