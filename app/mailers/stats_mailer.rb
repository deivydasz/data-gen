class StatsMailer < ApplicationMailer


	def stats_mail(iterations)
		@persons = Person.all
		@number = iterations
		mail(to: 'deivydas.ziziliauskas@gmail.com', subject: "Last generation stats #{@number}")
	end
end
