require 'sidekiq/api'
require 'csv'

class WelcomeController < ApplicationController

  def index
  	@darbai = Sidekiq::Queue.new.size
  	@persons = Person.count
    @exports = ExportList.all
  end

  def generate
    pg = PersonGenerator.create(total_count: params[:iteration].to_i,
                                first_names: params[:first_name].split,
                                last_names: params[:last_name].split,
                                addresses: params[:adress].split)
    IteratorWorker.perform_async(pg.id)
    redirect_to root_path
  end

  def download_csv
    respond_to do |format|
      format.html
      format.csv { send_data Person.to_csv filename: "person-#{Date.today}.csv" }
    end
  end

  def generate_file
    el = ExportList.create(exported_count: 0, total_count: Person.count,
                             file_url: "", status: "starter")    
    FileGeneratorWorker.perform_async(el.id)
    redirect_to root_path
  end

end
