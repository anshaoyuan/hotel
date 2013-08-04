require_relative 'customer_service'
class Hotel
	attr_reader :position,:rate,
	:weekday_rates_regular,:weekday_rates_rewards,
	:weekend_rates_regular,:weekend_rates_rewards
	def initialize(position,rate,option)
		@position ,@rate = position , rate
		
		@weekday_rates_regular = option[:weekday_rates_regular]
		@weekday_rates_rewards = option[:weekday_rates_rewards]
		@weekend_rates_regular = option[:weekend_rates_regular]
		@weekend_rates_rewards = option[:weekend_rates_rewards]
		Cus_service.add_hotel(self)
	end

end