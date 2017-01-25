require 'sidekiq/api'

class WelcomeController < ApplicationController

  def index
  	@darbai = Sidekiq::Queue.new.size
  	@persons = Person.all
  end

  def generate
    pg = PersonGenerator.create(total_count: params[:iteration].to_i,
                                first_names: params[:first_name].split,
                                last_names: params[:last_name].split,
                                addresses: params[:adress].split)
    IteratorWorker.perform_async(pg.id)
    redirect_to root_path
  end

end
