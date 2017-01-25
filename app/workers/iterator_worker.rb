class IteratorWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'default'


  def perform(pg_id)
    pg = PersonGenerator.find(pg_id)
    pg.total_count.times do
      GenerateWorker.perform_async(pg.id, pg.first_names.sample, pg.last_names.sample, pg.addresses.sample)
    end
  end
end
