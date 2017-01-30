require 'csv'

class FileGeneratorWorker
  include Sidekiq::Worker

  def perform(el_id)
    # Do something
    el = ExportList.find(el_id)
    file_name = "file#{el_id}.csv"
    CSV.open("public/#{file_name}", "wb") do |csv|
    	csv << Person.attribute_names  
    	Person.all.each do |person|
    		csv << person.attributes.values
			end
    end
    el.update(status: 'completed', file_url: file_name)

  end
end
