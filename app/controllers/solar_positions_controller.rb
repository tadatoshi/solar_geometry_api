class SolarPositionsController < ApplicationController

  def create

    solar_position_params = params.select { |key, value| key != "action" && key != "controller" }
    
    @solar_position = SolarPosition.new(solar_position_params)

    if @solar_position.valid?
      # location parameter passes @solar_position object as an option. 
      # render json: @solar_position, status: :created, location: @solar_position
      render json: @solar_position, status: 200
    else
      render json: @solar_position.errors, status: :unprocessable_entity
    end
  end

end
