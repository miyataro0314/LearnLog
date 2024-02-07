class MainController < ApplicationController
  def top
    calculate_total_time
  end


  def calculate_total_time
    if @current_user
      @diff = 0
      @measurements = Measurement.where(date: Date.today, user_id: @current_user.id)
      @measurements.each do |measurement|
        if measurement.end_at != nil
          @diff += measurement.end_at - measurement.start_at
        end
      end
      @hours = (@diff / 3600).to_i
      @minuits = ((@diff % 3600) / 60).to_i
    end
  end
end
