require 'spec_helper'

describe Year do
  # before :each do
  #   @year = Year.new
  # end

  # describe "count" do
  #   it "has 14 years" do
  #       @year.should be_an_instance_of Year
  #   end

  # end

  describe Year do
    it{ should have_column :year, :type => Integer }
  end

end