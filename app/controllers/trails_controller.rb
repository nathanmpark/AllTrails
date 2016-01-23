class TrailsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index

  end
  
  def create
    Trail.new(name: , distance: ,)    
    render json: params
  end
end
