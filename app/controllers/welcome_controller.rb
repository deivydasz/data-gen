require 'sidekiq/api'

class WelcomeController < ApplicationController

  def index
  	@darbai = Sidekiq::Queue.new.size
  	@persons = Person.all
  end

  def generate
  	iterate = params[:iteration].to_i
  	first_name = params[:first_name].split(' ')
  	last_name = params[:last_name].split(' ')
  	adress = params[:adress].split(' ')  	
  	IteratorWorker.perform_async(iterate, first_name, last_name, adress)
  	redirect_to root_path
  end

end
