class SenderWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'mailer'

  def perform(iterate)
  	iter = iterate
  	puts "SIUNCIU LAISKA"

    StatsMailer.stats_mail(iter).deliver_later
  	puts "EMAIL SENT ABOUT #{iter}  CREATED PERSONS"

  end
end
