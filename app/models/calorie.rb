class Calorie < ActiveRecord::Base
  def self.hike_time(dist, pace)

    dist = dist.to_f*0.000621371 # converts distance to miles
    pace = pace.to_f

    hours = dist/pace
    if hours % 1 == 0
      min = 0
    else
      min = (hours % 1) * 60
    end

    if min % 1 == 0
      sec = 0
    else
      sec = (min % 1) * 60
    end

    return {hours: hours.to_i, min: min.to_i, sec: sec.to_i}
  end

  def self.calorie_counter(weight, pace, dist, elev_gain)

    weight = weight.to_f
    pace = (60/pace.to_f)*60 #converts pace from mph to min/mile
    dist = dist.to_f*0.000621371 #converts dist from meters to miles
    elev_gain = elev_gain.to_f*3.28084

    diff = ((((elev_gain/(dist*5280)*100)*4)+(Math.sqrt((dist*dist)*6)))/2.5);
    
    calories = ((((weight * 2462.4)+44044)/(pace**1.0045))+(Math.sqrt(((diff**3)))));

    return calories.to_i
  end  

end
