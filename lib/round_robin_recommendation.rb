# frozen_string_literal: true
require 'json'
require "round_robin_recommendation/version"

module RoundRobinRecommendation

  	class Error < StandardError; end
  	
	class Recommendation

		attr_accessor :articles

		# In this variable we store the max amount of tokens that we want to recommend
		MAX_RECOMMENDED_ARTICLES = 4

		# This method initialize "articles" variable with its parameter and convert it to json
		# @param [String] articles contains the data to analyze
		# @raise [StandardError] expectation if json is not valid and stop execution
		def initialize(articles) 
			unless @articles = readable_json(articles)
			  raise StandardError, 'JSON is not valid'
			end
		end

		# This function applies round robin aproach in order to get tokens from the json object. 
		# In this process, we find two important variables: total_articles and MAX_RECOMMENDED_ARTICLES
		# With those variables we can control how many iterations the algorithm needs to do in order to get the maximun tokens.
		# @return [Array] token_result List of recommended tokens 
		def suggest()

			# It is necessary to clone the json in order to manipulate it
			articles_clone = articles.clone

			# This variable stores the total of articles in logs/content/myad categories inside the json
			total_articles = articles_clone["logs"].length + articles_clone["content"].length + articles_clone["myad"].length

			# This variable stores the result in array
			token_result =  Array.new

			loop do
				articles_clone.each do |key, array_value|
					break unless token_result.length < MAX_RECOMMENDED_ARTICLES       
					next if array_value.empty?

					array = array_value.shift		                        # Store the first element of the array in this iteration
					token_result.push(array["token"].to_i)                  # We add a new "token" from the element
				end

				# It is mandatory to control the amount of items in the array (token_result), otherwise, we have an infinite loop.
				break unless token_result.length < MAX_RECOMMENDED_ARTICLES && token_result.length < total_articles	
			end

			token_result 
		end

		# This method parse the data with JSON.parse(), and the data becomes an object
		# @param [String] String to parse
		# @return [Hash/Nil] json parsed, in case of error return nil  
		def readable_json(json)
		    JSON.parse(json) rescue nil
		end
	end
end