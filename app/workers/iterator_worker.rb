class IteratorWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'default'


  def perform(iterate, first_name, last_name, adress)
  	puts "ITERATION STARTED"
    iterate.times do |iter|
  		GenerateWorker.perform_async(first_name.sample, last_name.sample, adress.sample)
  	end
  	puts "ITERATION ENDED"
  	SenderWorker.perform_async(iterate)
  end
end
