class Person < ApplicationRecord

	# scope :same_name -> {"SELECT Rate, count(*) * 100.0 / (select count(*) from MyTable) FROM MyTable GROUP BY Rate;"}
	
end
