class GenerateWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'default'

  def perform(pg_id, first_name, last_name, adress)
    pg = PersonGenerator.find(pg_id)
    Person.create(first_name: first_name, last_name: last_name, adress: adress)
    pg.increment!(:current_count)
    pg.complete if pg.current_count == pg.total_count
  end
end
