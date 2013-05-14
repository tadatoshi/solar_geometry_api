require 'json'

class SolarPosition
  include SolarGeometryCalculation::CalculationHelper
  include ActiveModel::Validations

  attr_accessor :latitude, :meridian, :longitude, :timezone_identifier, :year, :month, :day, :hour, :minute, :surface_inclination, :surface_azimuth

  validates :latitude, :presence => true, :numericality => true, :range => { :min_degree => 0, :max_degree => 90 }
  validates :meridian, :presence => true, :numericality => true, :range => { :min_degree => -180, :max_degree => 180 }
  validates :longitude, :presence => true, :numericality => true, :range => { :min_degree => -180, :max_degree => 180 }
  validates :timezone_identifier, :presence => true
  validates :surface_inclination, :presence => true, :numericality => true, :range => { :min_degree => 0, :max_degree => 90 }
  validates :surface_azimuth, :presence => true, :numericality => true, :range => { :min_degree => -180, :max_degree => 180 }  

  def initialize(attributes = {})
    attributes.each { |attribute_name, attribute_value| self.send("#{attribute_name}=".to_sym, attribute_value) }
  end

  def date
    if @year.present? && @month.present? && @day.present?
      "#{self.class.format_month(@month)}/#{self.class.format_day(@day)}/#{@year}"  
    end   
  end

  def date=(date_string)
    @month, @day, @year = date_string.split('/').map(&:to_i)
  end

  def time=(time_string)
    @hour, @minute = time_string.split(':').map(&:to_i)
  end

  %w{declination hour_angle solar_elevation solar_azimuth sunrise sunset angle_of_incidence}.each do |calculation_method_name|
    define_method(calculation_method_name.to_sym) do
      create_solar_position_calculation if @solar_position_calculation.blank?
      @solar_position_calculation.send(calculation_method_name.to_sym)
    end
  end       

  def to_json(options = {})
    result_hash = Hash.new
    %w{declination hour_angle solar_elevation solar_azimuth sunrise sunset angle_of_incidence}.each do |result_parameter_name|
      result_hash[result_parameter_name] = send(result_parameter_name.to_sym)
    end  
    JSON.generate(result_hash)
  end

  class << self
    def format_minute(minute)
      minute.to_s.length == 1 ? "0#{minute.to_s}" : minute.to_s
    end  

    alias_method :format_month, :format_minute
    alias_method :format_day, :format_minute

  end

  private 
    def create_solar_position_calculation
      @solar_position_calculation = SolarGeometryCalculation::SolarPositionCalculation.new(:latitude => latitude, :meridian => meridian, :longitude => longitude, :timezone_identifier => timezone_identifier, :year => year, :month => month, :day => day, :hour => hour, :minute => minute, :surface_inclination => surface_inclination, :surface_azimuth => surface_azimuth)
    end  

end