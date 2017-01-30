class Person < ApplicationRecord

	def self.to_csv    
		attributes = %w{first_name last_name adress}    
		CSV.generate(headers: true) do |csv|
			csv << attributes
			all.each do |user|
				csv << attributes.map{ |attr| user.send(attr) }
			end
		end
	end


	# scope :same_name -> {"SELECT Rate, count(*) * 100.0 / (select count(*) from MyTable) FROM MyTable GROUP BY Rate;"}
	
end
