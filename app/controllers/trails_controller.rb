class TrailsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index

  end
  
  def create
    name = params[:name]
    length = params[:trailGeoStats][:length]
    elevation_gain = params[:trailGeoStats][:elevation_gain]
    trail = Trail.find_or_initialize_by(name: name, length: length, elevation_gain: elevation_gain)
    
    if trail.new_record?
      trail.save
      render nothing: true
    elsif trail.persisted?
      render nothing: true
    else
      render status: 401
    end
  end

end
