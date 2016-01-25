class Trail < ActiveRecord::Base
  has_many :hikes

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
  
end



 