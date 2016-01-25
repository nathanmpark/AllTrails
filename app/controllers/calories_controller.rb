class CaloriesController < ApplicationController

  def index
    @trails = Trail.all

    if request.xhr?
      if params[:pace] == "0" || params[:weight] == "0" || params[:trailName].include?("Select")
        flash[:error] = "*Please select a trail, set hiking pace, and/or adjust weight"
      else
        trail_data = Trail.find_by(name: params[:trailName])
        distance = trail_data.distance
        calories = Calorie.calorie_counter(params[:weight], params[:pace], distance, trail_data.elevation_gain)
        time = Trail.hike_time(trail_data.distance, params[:pace])
      end

      render 'calories/_calorieResults', locals: {calories: calories, time: time, distance: distance.to_i}, layout: false
    end
  end

end
