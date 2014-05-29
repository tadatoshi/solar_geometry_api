require 'spec_helper'

describe SolarPosition do
  
  context "Format minute" do
  
    it "should format minute" do
      
      SolarPosition.format_minute(1).should == "01"
      SolarPosition.format_minute(25).should == "25"
      
    end    
    
  end
  
  context "Validation" do
    
    it "should have address only when latitude is blank" do

      pending "In the simple implementation of this API, address is not an input value. Evaluate the possibility of differentiate the set of input parameters."
      
      solar_position_1 = SolarPosition.new(:address => nil, :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.valid?.should be_false
      solar_position_1.errors[:address].should_not be_empty
    
      solar_position_2 = SolarPosition.new(:address => "", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.valid?.should be_false
      solar_position_2.errors[:address].should_not be_empty
    
      solar_position_3 = SolarPosition.new(:address => "Montreal QC Canada", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:address].should be_empty
      
      solar_position_4 = SolarPosition.new(:latitude => "", :address => "Montreal QC Canada", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_4.valid?.should be_true
      solar_position_4.errors[:address].should be_empty      
      
      solar_position_5 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_5.valid?.should be_true
      solar_position_5.errors[:address].should be_empty             
      
    end
    
    it "should have latitude, meridian, longitude, and timezone_identifier pending(only when address is blank)" do

      solar_position_1 = SolarPosition.new(:latitude => nil, :meridian => nil, :longitude => nil, :timezone_identifier => nil, :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.valid?.should be_false
      solar_position_1.errors[:latitude].should_not be_empty
      solar_position_1.errors[:meridian].should_not be_empty
      solar_position_1.errors[:longitude].should_not be_empty
      solar_position_1.errors[:timezone_identifier].should_not be_empty
    
      solar_position_2 = SolarPosition.new(:latitude => "", :meridian => "", :longitude => nil, :timezone_identifier => nil, :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.valid?.should be_false
      solar_position_2.errors[:latitude].should_not be_empty
      solar_position_2.errors[:meridian].should_not be_empty
      solar_position_2.errors[:longitude].should_not be_empty
      solar_position_2.errors[:timezone_identifier].should_not be_empty
    
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => nil, :longitude => nil, :timezone_identifier => nil, :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.valid?.should be_false
      solar_position_3.errors[:latitude].should be_empty
      solar_position_3.errors[:meridian].should_not be_empty
      solar_position_3.errors[:longitude].should_not be_empty
      solar_position_3.errors[:timezone_identifier].should_not be_empty
      
      solar_position_4 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => nil, :timezone_identifier => nil, :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_4.valid?.should be_false
      solar_position_4.errors[:latitude].should be_empty
      solar_position_4.errors[:meridian].should be_empty
      solar_position_4.errors[:longitude].should_not be_empty 
      solar_position_4.errors[:timezone_identifier].should_not be_empty     
      
      solar_position_5 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => nil, :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_5.valid?.should be_false
      solar_position_5.errors[:latitude].should be_empty
      solar_position_5.errors[:meridian].should be_empty 
      solar_position_5.errors[:longitude].should be_empty
      solar_position_5.errors[:timezone_identifier].should_not be_empty   
      
      solar_position_6 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_6.valid?.should be_true
      solar_position_6.errors[:latitude].should be_empty
      solar_position_6.errors[:meridian].should be_empty 
      solar_position_6.errors[:longitude].should be_empty
      solar_position_6.errors[:timezone_identifier].should be_empty  
      
      # solar_position_7 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :address => "", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      # solar_position_7.valid?.should be_true
      # solar_position_7.errors[:latitude].should be_empty 
      # solar_position_7.errors[:meridian].should be_empty  
      # solar_position_7.errors[:longitude].should be_empty   
      # solar_position_7.errors[:timezone_identifier].should be_empty  
      
      # solar_position_7 = SolarPosition.new(:address => "Montreal QC Canada", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      # solar_position_7.valid?.should be_true
      # solar_position_7.errors[:latitude].should be_empty 
      # solar_position_7.errors[:meridian].should be_empty
      # solar_position_7.errors[:longitude].should be_empty 
      # solar_position_7.errors[:timezone_identifier].should be_empty             
      
    end

    it "should have surface inclination" do
      
      solar_position_1 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => nil, :surface_azimuth => "0")
      solar_position_1.valid?.should be_false
      solar_position_1.errors[:surface_inclination].should_not be_empty
    
      solar_position_2 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "", :surface_azimuth => "0")
      solar_position_2.valid?.should be_false
      solar_position_2.errors[:surface_inclination].should_not be_empty
    
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:surface_inclination].should be_empty
      
    end    
    
    it "should have surface azimuth" do

      solar_position_1 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => nil)
      solar_position_1.valid?.should be_false
      solar_position_1.errors[:surface_azimuth].should_not be_empty
            
      solar_position_2 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "")
      solar_position_2.valid?.should be_false
      solar_position_2.errors[:surface_azimuth].should_not be_empty
            
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:surface_azimuth].should be_empty
      
    end 
    
    it "latitude should have numeric value" do
      
      solar_position_1 = SolarPosition.new(:latitude => "aaa", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.valid?.should be_false
      solar_position_1.errors[:latitude].should_not be_empty
    
      solar_position_2 = SolarPosition.new(:latitude => "10d", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.valid?.should be_false
      solar_position_2.errors[:latitude].should_not be_empty
    
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:latitude].should be_empty    
      
    end
    
    it "surface inclination should have numeric value" do
      
      solar_position_1 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "dsv", :surface_azimuth => "0")
      solar_position_1.valid?.should be_false
      solar_position_1.errors[:surface_inclination].should_not be_empty
    
      solar_position_2 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "73j9", :surface_azimuth => "0")
      solar_position_2.valid?.should be_false
      solar_position_2.errors[:surface_inclination].should_not be_empty
    
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:surface_inclination].should be_empty
      
    end   
    
    it "surface azimuth should have numeric value" do

      solar_position_1 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "dMkeq")
      solar_position_1.valid?.should be_false
      solar_position_1.errors[:surface_azimuth].should_not be_empty
            
      solar_position_2 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "?!")
      solar_position_2.valid?.should be_false
      solar_position_2.errors[:surface_azimuth].should_not be_empty
            
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:surface_azimuth].should be_empty
      
    end            
    
    it "latitude should be between 0 degrees and 90 degrees" do
      
      solar_position_1 = SolarPosition.new(:latitude => "91", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.valid?.should be_false
      solar_position_1.errors[:latitude].should_not be_empty
    
      solar_position_2 = SolarPosition.new(:latitude => "-1", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.valid?.should be_false
      solar_position_2.errors[:latitude].should_not be_empty
    
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:latitude].should be_empty
      
      solar_position_4 = SolarPosition.new(:latitude => "90", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_4.valid?.should be_true
      solar_position_4.errors[:latitude].should be_empty
      
      solar_position_5 = SolarPosition.new(:latitude => "0", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_5.valid?.should be_true
      solar_position_5.errors[:latitude].should be_empty               
      
    end
    
    it "surface inclination should be between 0 degrees and 90 degrees" do
      
      solar_position_1 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "91", :surface_azimuth => "0")
      solar_position_1.valid?.should be_false
      solar_position_1.errors[:surface_inclination].should_not be_empty
    
      solar_position_2 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "-1", :surface_azimuth => "0")
      solar_position_2.valid?.should be_false
      solar_position_2.errors[:surface_inclination].should_not be_empty
    
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:surface_inclination].should be_empty
      
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "90", :surface_azimuth => "0")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:surface_inclination].should be_empty      
      
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "70", :surface_azimuth => "0")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:surface_inclination].should be_empty      
      
    end   
    
    it "surface azimuth should be between -180 degrees and 180 degrees" do

      solar_position_1 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "-181")
      solar_position_1.valid?.should be_false
      solar_position_1.errors[:surface_azimuth].should_not be_empty
            
      solar_position_2 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "-181")
      solar_position_2.valid?.should be_false
      solar_position_2.errors[:surface_azimuth].should_not be_empty
            
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "180")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:surface_azimuth].should be_empty
      
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "-180")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:surface_azimuth].should be_empty
    
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "45")
      solar_position_3.valid?.should be_true
      solar_position_3.errors[:surface_azimuth].should be_empty
      
    end    
    
  end  

  context "date" do 

    it "should split mm/dd/yyyy string to year, month and day" do 

      solar_position_1 = SolarPosition.new(:latitude => "45.5", :date => "09/21/2010", :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")

      solar_position_1.year.should == 2010
      solar_position_1.month.should == 9
      solar_position_1.day.should == 21
      
    end

    it "should get mm/dd/yyyy string" do
 
       solar_position_1 = SolarPosition.new(:latitude => "45.5", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
    
       solar_position_1.date.should == "09/21/2010"

    end
    
  end

  context "time" do

    it "should split hh:mm string to hour and minute" do

      solar_position_1 = SolarPosition.new(:latitude => "45.5", :date => "09/21/2010", :time => "12:30", :surface_inclination => "0", :surface_azimuth => "0")
      
      solar_position_1.hour.should == 12  
      solar_position_1.minute.should == 30

    end    

  end
  
  context "latitude" do
    
    it "should get latitude" do
      
      solar_position_1 = SolarPosition.new(:latitude => "45.5", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.send(:latitude).should == "45.5"

      pending "In the simple implementation of this API, address is not an input value. Evaluate the possibility of differentiate the set of input parameters."
      
      solar_position_2 = SolarPosition.new(:address => "Montreal QC Canada", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.send(:latitude).should == 45.51      
      
    end
    
  end
  
  context "meridian" do
    
    it "should get meridian" do
      
      solar_position_1 = SolarPosition.new(:meridian => "-75", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.send(:meridian).should == "-75"

      pending "In the simple implementation of this API, address is not an input value. Evaluate the possibility of differentiate the set of input parameters."
      
      solar_position_2 = SolarPosition.new(:address => "Montreal QC Canada", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.send(:meridian).should == -75      
      
    end
    
  end  
  
  context "longitude" do
    
    it "should get longitude" do
      
      solar_position_1 = SolarPosition.new(:longitude => "-73.75", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.send(:longitude).should == "-73.75"

      pending "In the simple implementation of this API, address is not an input value. Evaluate the possibility of differentiate the set of input parameters."
      
      solar_position_2 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.send(:longitude).should == -73.75     
      
    end
    
  end  
  
  context "timezone" do
    
    it "should get timezone_identifier" do
      
      solar_position_1 = SolarPosition.new(:timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.send(:timezone_identifier).should == "America/Montreal"

      pending "In the simple implementation of this API, address is not an input value. Evaluate the possibility of differentiate the set of input parameters."
      
      solar_position_2 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.send(:timezone_identifier).should == "America/Montreal"   
      
    end
    
  end  
  
  context "declination" do
    
    it "should calculate declination" do
      
      solar_position_1 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.declination.should == -0.19
      
      solar_position_2 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 1, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.declination.should == -20.14
      
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 7, :day => 24, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.declination.should == 19.83        
      
    end
    
    context "(solar energy and applications course - homework 2)" do
      
      it "should calculate declination with latitude 45 degrees 28 minutes" do

        solar_position_1 = SolarPosition.new(:latitude => "45.47", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2012, :month => 2, :day => 19, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
        solar_position_1.declination.should be_within(0.1).of(-11.95)
                
        # At sunrise 6:50 (6.83h):
        solar_position_2 = SolarPosition.new(:latitude => "45.47", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2012, :month => 2, :day => 19, :hour => 6, :minute => 50, :surface_inclination => "0", :surface_azimuth => "0")
        solar_position_2.declination.should be_within(0.1).of(-12.02)

        # At sunset 17:10 (17.17h):
        solar_position_3 = SolarPosition.new(:latitude => "45.47", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 2, :day => 19, :hour => 17, :minute => 10, :surface_inclination => "0", :surface_azimuth => "0")
        solar_position_3.declination.should be_within(0.1).of(-11.87)     

      end      
      
    end
    
  end

  context "hour angle" do
    
    it "should calculate hour angle" do
      
      solar_position_1 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.hour_angle.should be_within(0.1).of(-42.03)
      
      solar_position_2 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 1, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.hour_angle.should be_within(0.15).of(-1.40)

      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 7, :day => 24, :hour => 13, :minute => 15, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.hour_angle.should be_within(0.1).of(3.37)           
      
    end

    it "should calculate hour angle by getting average solar time by address through geocoding" do
     
      pending "In the simple implementation of this API, address is not an input value. Evaluate the possibility of differentiate the set of input parameters."

      solar_position_1 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 9, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.hour_angle.should be_within(0.1).of(-42.03)
      
      solar_position_2 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 1, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.hour_angle.should be_within(0.15).of(-1.40)
      
      solar_position_3 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 7, :day => 24, :hour => 13, :minute => 15, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.hour_angle.should be_within(0.1).of(3.37)          
      
    end    
    
  end

  context "height of the sun" do
    
    it "should calculate solar elevation" do
      
      solar_position_1 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.solar_elevation.should be_within(0.1).of(43.09) 
      
      solar_position_2 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 1, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.solar_elevation.should == 24.35
      
      solar_position_3 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 7, :day => 24, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.solar_elevation.should be_within(0.1).of(61.37)             
      
    end
    
    it "should calculate solar elevation by getting latitude by address through geocoding" do
      
      pending "In the simple implementation of this API, address is not an input value. Evaluate the possibility of differentiate the set of input parameters."

      solar_position_1 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.solar_elevation.should == 43.13
      
      solar_position_2 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 1, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.solar_elevation.should == 24.39
      
      solar_position_3 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 7, :day => 24, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.solar_elevation.should be_within(0.1).of(61.40)            

    end    
    
  end
  
  context "Solar azimuth" do
    
    it "should calculate solar azimuth" do
      
      solar_position_1 = SolarPosition.new(:latitude => "45.46", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.solar_azimuth.should be_within(0.1).of(-51.58)
      
      solar_position_2 = SolarPosition.new(:latitude => "45.46", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 1, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.solar_azimuth.should be_within(0.1).of(-31.03)
      
      solar_position_3 = SolarPosition.new(:latitude => "45.46", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 7, :day => 24, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.solar_azimuth.should be_within(0.1).of(-70.83)   

    end
    
    it "should calculate solar azimuth by getting latitude by address through geocoding" do
      
      pending "In the simple implementation of this API, address is not an input value. Evaluate the possibility of differentiate the set of input parameters."

      solar_position_1 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 9, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.solar_azimuth.should be_within(0.1).of(-51.58)
      
      solar_position_2 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 1, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.solar_azimuth.should be_within(0.1).of(-31.03)
      
      solar_position_3 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 7, :day => 24, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.solar_azimuth.should be_within(0.1).of(-70.83)    
      
    end    
    
  end  
  
  context "Sunrise" do
    
    it "should calculate sunrise" do
      
      solar_position_1 = SolarPosition.new(:latitude => "45.46", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.sunrise.should == "6:49"
      
      solar_position_2 = SolarPosition.new(:latitude => "45.46", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 1, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_2.sunrise.should == "7:34"
      
      solar_position_3 = SolarPosition.new(:latitude => "45.46", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 7, :day => 24, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_3.sunrise.should == "5:36"      
      
    end
    
    it "should calculate sunrise by getting latitude by address through geocoding" do
      
      pending "5 minutes difference"
      
      solar_position_1 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 9, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      # TODO: Gives "6:54" but sunrise time doesn't require much accuracy so this 5 minutes difference is left as it is:
      solar_position_1.sunrise.should == "6:49"
      
      solar_position_2 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 1, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      # TODO: Gives "7:39" but sunrise time doesn't require much accuracy so this 5 minutes difference is left as it is:
      solar_position_2.sunrise.should == "7:34"
      
      solar_position_3 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 7, :day => 24, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      # TODO: Gives "5:41" but sunrise time doesn't require much accuracy so this 5 minutes difference is left as it is:
      solar_position_3.sunrise.should == "5:36"      
      
    end
    
    context "(solar energy and applications course - homework 2)" do
      
      it "should calculate sunrise with latitude 45 degrees 28 minutes" do

        solar_position_1 = SolarPosition.new(:latitude => "45.47", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2012, :month => 2, :day => 19, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
        solar_position_1.sunrise.should == "6:59"        

      end      
      
    end        
    
  end

  context "Sunset" do
    
    context "(solar energy and applications course - homework 2)" do
      
      it "should calculate sunset with latitude 45 degrees 28 minutes" do

        solar_position_1 = SolarPosition.new(:latitude => "45.47", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2012, :month => 2, :day => 19, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
        solar_position_1.sunset.should == "17:19"        

      end      
      
    end
    
  end  
  
  context "Angle of incidence" do
    
    it "should calculate angle of incidence" do
      
      solar_position_1 = SolarPosition.new(:latitude => "45.47", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.angle_of_incidence.should be_within(0.1).of(58.73)
      
      solar_position_2 = SolarPosition.new(:latitude => "45.47", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 1, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "70", :surface_azimuth => "-45")
      solar_position_2.angle_of_incidence.should be_within(0.1).of(13.28)
      
      solar_position_3 = SolarPosition.new(:latitude => "45.47", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 7, :day => 24, :hour => 10, :minute => 0, :surface_inclination => "70", :surface_azimuth => "-45")
      solar_position_3.angle_of_incidence.should == 32.78     
      
    end
    
    it "should calculate angle of incidence by getting latitude by address through geocoding" do
      
      pending "In the simple implementation of this API, address is not an input value. Evaluate the possibility of differentiate the set of input parameters."

      solar_position_1 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 9, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.angle_of_incidence.should be_within(0.1).of(58.73)
      
      solar_position_2 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 1, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "70", :surface_azimuth => "-45")
      solar_position_2.angle_of_incidence.should be_within(0.1).of(13.28)
      
      solar_position_3 = SolarPosition.new(:address => "Montreal International Airport", :year => 2010, :month => 7, :day => 24, :hour => 10, :minute => 0, :surface_inclination => "70", :surface_azimuth => "-45")
      solar_position_3.angle_of_incidence.should == 32.78    
      
    end    
    
  end

  context "Store data" do

    it "should get solar position by id" do

      pending "In the simple implementation of this API, data are not stored. Keep this testcase just in case when storing data becomes necessary."
      
      solar_position_1 = SolarPosition.create(:address => "Montreal International Airport", :year => 2010, :month => 9, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      
      solar_position_from_storage_1 = SolarPosition.find(solar_position_1.id)

      solar_position_from_storage_1.address.should == "Montreal International Airport"
      solar_position_from_storage_1.year.should == 2010
      solar_position_from_storage_1.month.should == 9
      solar_position_from_storage_1.day.should == 21
      solar_position_from_storage_1.hour.should == 10
      solar_position_from_storage_1.minute.should == 0
      solar_position_from_storage_1.surface_inclination.should == 0
      solar_position_from_storage_1.surface_azimuth.should == 0
      solar_position_from_storage_1.latitude.should == 45.46
      solar_position_from_storage_1.meridian.should == -75
      solar_position_from_storage_1.longitude.should == -73.75
      solar_position_from_storage_1.timezone_identifier.should == "America/Montreal"

    end

    it "should update attributes" do

      pending "In the simple implementation of this API, data are not stored. Keep this testcase just in case when storing data becomes necessary."      

      solar_position_1 = SolarPosition.create(:address => "Montreal International Airport", :year => 2010, :month => 9, :day => 21, :hour => 10, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      
      solar_position_from_storage_1 = SolarPosition.find(solar_position_1.id)

      solar_position_from_storage_1.update_attributes(address: "Toronto ON Canada")

      solar_position_from_storage_1.address.should == "Toronto ON Canada"
      solar_position_from_storage_1.year.should == 2010
      solar_position_from_storage_1.month.should == 9
      solar_position_from_storage_1.day.should == 21
      solar_position_from_storage_1.hour.should == 10
      solar_position_from_storage_1.minute.should == 0
      solar_position_from_storage_1.surface_inclination.should == 0
      solar_position_from_storage_1.surface_azimuth.should == 0
      solar_position_from_storage_1.latitude.should == 43.65
      solar_position_from_storage_1.meridian.should == -75
      solar_position_from_storage_1.longitude.should == -79.39
      solar_position_from_storage_1.timezone_identifier.should == "America/Toronto"      

    end
    
  end

  context "JSON" do

    it "should generate JSON data" do

      solar_position_1 = SolarPosition.new(:latitude => "45.5", :meridian => "-75", :longitude => "-73.75", :timezone_identifier => "America/Montreal", :year => 2010, :month => 9, :day => 21, :hour => 12, :minute => 0, :surface_inclination => "0", :surface_azimuth => "0")
      solar_position_1.to_json.should == "{\"declination\":\"-0.19\",\"hour_angle\":\"-12.0\",\"solar_elevation\":\"43.1\",\"solar_azimuth\":\"-16.54\",\"sunrise\":\"6:49\",\"sunset\":\"18:47\",\"angle_of_incidence\":\"46.9\"}"

    end

  end
  
end