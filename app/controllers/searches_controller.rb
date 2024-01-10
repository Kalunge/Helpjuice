class SearchesController < ApplicationController
  protect_from_forgery except: :create

  def index
  end

  def create
    query = params[:query]
    puts "Search query enteed is: #{query}"
  end
end
