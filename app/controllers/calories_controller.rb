class CaloriesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @trails = Trail.all

    if request.xhr?
      if params[:pace] == "0" || params[:weight] == "0" || params[:trailName].include?("Select")
        flash[:error] = "*Please select a trail, set hiking pace, and/or adjust weight"
      else
        trail_data = Trail.find_by(name: params[:trailName])
        distance = trail_data.distance
        calories = Trail.calorie_counter(params[:weight], params[:pace], distance, trail_data.elevation_gain)
        time = Trail.hike_time(trail_data.distance, params[:pace])
      end

      render 'trails/_calorieResults', locals: {calories: calories, time: time, distance: distance.to_i}, layout: false
    end
  end
  
  def create
    name = params[:name]
    distance = params[:trailGeoStats][:length]
    elevation_gain = params[:trailGeoStats][:elevationGain]
    trail = Trail.find_or_initialize_by(name: name, distance: distance, elevation_gain: elevation_gain)
    
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
