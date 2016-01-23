class Trail < ActiveRecord::Base
  has_many :hikes

  def calorie_counter(weight, pace, dist, elev_gain)
    full_dist = (dist^2) + (elev_gain^2)
    final_dist = sqrt(full_dist)

    return final_dist
  end

  def hike_time(dist, pace)
    # distance is in meters
    # pace is in meters per hour

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
