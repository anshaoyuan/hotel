require 'spec_helper'
describe Customer do 
	context "only one day for reservation" do 
		it "weekend_total should be 1  and weekday_tatal should be 0 when date is a weekend" do
			customer = Customer.new("Regular","03Aug2013")
			customer.weekend_total.should be 1
			customer.weekday_tatal.should be 0
		end
		it "weekend_total should be 0  and  weekday_tatal should be 1 when date is a weekday" do
			customer = Customer.new("Regular","06Aug2013")
			customer.weekend_total.should be 0
			customer.weekday_tatal.should be 1
		end
	end
	context "three days for reservation" do
		it "should not be 0 when reservation dates with weekend and weekday" do 
			customer = Customer.new("Regular","20Mar2009","21Mar2009","22Mar2009")
			customer.weekend_total.should_not be 0
			customer.weekday_tatal.should_not be 0
			customer.weekend_total.should be 2
			customer.weekday_tatal.should be 1
		end
	end
	context "find the cheapest hotel" do 
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
		it "should be Lakewood when type is Regular and dates is 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)" do
			customer = Customer.new("Regular","16Mar2009","16Mar2009","17Mar2009")
			customer.find_cheapest_hotel.position.should be_eql("Lakewood")
		end
		it "should be Bridgewood when type is Regular and dates is 20Mar2009(fri), 21Mar2009(sat), 22Mar2009(sun)" do 
			customer = Customer.new("Regular","20Mar2009","21Mar2009","22Mar2009")
			customer.find_cheapest_hotel.position.should be_eql("Bridgewood")
		end
		it "should be Ridgewood when type is Rewards and dates is  26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat)" do 
			customer = Customer.new("Rewards","26Mar2009","27Mar2009","28Mar2009")
			customer.find_cheapest_hotel.position.should be_eql("Ridgewood")
		end
	end
end