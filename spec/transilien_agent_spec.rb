require 'rails_helper'
require 'huginn_agent/spec_helper'

describe Agents::TransilienAgent do
  before(:each) do
    @valid_options = Agents::TransilienAgent.new.default_options
    @checker = Agents::TransilienAgent.new(:name => "TransilienAgent", :options => @valid_options)
    @checker.user = users(:bob)
    @checker.save!
  end

  pending "add specs here"
end
