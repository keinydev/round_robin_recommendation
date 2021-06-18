# frozen_string_literal: true
require 'json'

RSpec.describe RoundRobinRecommendation do
	it "has a version number" do
	    expect(RoundRobinRecommendation::VERSION).not_to be nil
	end

	#json files path
	json_path_1 = File.join( File.dirname(__FILE__), 'data/scenario_1.json')
	json_path_2 = File.join( File.dirname(__FILE__), 'data/scenario_2.json')
	json_path_3 = File.join( File.dirname(__FILE__), 'data/scenario_3.json')
	json_path_4 = File.join( File.dirname(__FILE__), 'data/scenario_4.json')

	it "Scenario 1 should return [345048]" do
		scenario = File.read(json_path_1)
	    recomendation = RoundRobinRecommendation::Recommendation.new(scenario)
	    expect(recomendation.suggest).to eq [345048]
	end

	it "Scenario 2 should return [790952, 103678, 788138, 802358]" do
		scenario = File.read(json_path_2)
		recomendation = RoundRobinRecommendation::Recommendation.new(scenario)
		expect(recomendation.suggest).to eq [790952, 103678, 788138, 802358]
	end	

	it "Scenario 3 should return [103678, 790952, 802358, 788138]" do
		scenario = File.read(json_path_3)
		recomendation = RoundRobinRecommendation::Recommendation.new(scenario)
		expect(recomendation.suggest).to eq [103678, 790952, 802358, 788138]
	end	

	it "Scenario 4 should return [790952, 103678, 802358, 562873]" do
		scenario = File.read(json_path_4)
		recomendation = RoundRobinRecommendation::Recommendation.new(scenario)
		expect(recomendation.suggest).to eq [790952, 103678, 802358, 562873]
	end		
end
