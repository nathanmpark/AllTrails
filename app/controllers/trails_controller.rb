class TrailsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @trails = Trail.all

    if request.xhr?
      trail_data = Trail.find_by(name: params[:trailName])
      calories = Trail.calorie_counter(params[:weight], params[:pace], trail_data.distance, trail_data.elevation_gain)
      render 'trails/_calorieResults', locals: {calories: calories}, layout: false
    end
  end
  
  def create
    name = params[:name]
    distance = params[:trailGeoStats][:length]
    elevation_gain = params[:trailGeoStats][:elevationGain]
    trail = Trail.find_or_initialize_by(name: name, distance: distance, elevation_gain: elevation_gain)
    
    p trail.new_record?

    if trail.new_record?
      trail.save
      p 'YOU ARE HERE'
      render nothing: true
    elsif trail.persisted?
      p 'elsif part'
      render nothing: true
    else
      p 'else statement'
      render status: 401
    end
  end

end
