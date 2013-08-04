require 'spec_helper'

describe Hotel do
	it "hotel's collection should not be empty when new a hotel object" do 
		hotel = Hotel.new("Bridgewood",4,
			weekday_rates_regular:160,
			weekday_rates_rewards:110,
			weekend_rates_regular:60,
			weekend_rates_rewards:50)
		Cus_service.get_hotels.should_not be_empty
		Cus_service.get_hotels[hotel.position.to_sym].should == hotel
	end
end