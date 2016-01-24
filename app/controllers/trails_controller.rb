class TrailsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @trails = Trail.all

    if request.xhr?
      if params[:pace] == "0" || params[:weight] == "0" || params[:trailName] == "Trails Dropdown"
        flash[:error] = "Please select a trail, set hiking pace, and/or adjust weight"
      else
        trail_data = Trail.find_by(name: params[:trailName])
        calories = Trail.calorie_counter(params[:weight], params[:pace], trail_data.distance, trail_data.elevation_gain)
        time = Trail.hike_time(trail_data.distance, params[:pace])
      end
      
      render 'trails/_calorieResults', locals: {calories: calories, time: time}, layout: false
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
