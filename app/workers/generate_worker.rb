class GenerateWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'default'

  def perform(first_name, last_name, adress)
    puts "#{first_name} #{last_name} #{adress}"
    Person.create(first_name: first_name, last_name: last_name, adress: adress)
  end
end
