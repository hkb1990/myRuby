require_relative '../lib/gothonweb.rb'
require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class GothonwebTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	def assert_response(resp,contains=nil,matches=nil,headers=nil,status=200)
		assert_equal(resp.status,status,"Expected response #{status} not in #{resp}")

		if status == 200
			puts "here is the body"
			puts resp.body
			puts "here is the body"
			assert(resp.body,"Response data is empty.")
		end

		if contains
			puts "here is the body"
			puts resp.body
			puts "here is the body"
			assert((resp.body.include? contains),"Response does not contain #{contains}")
		end

		if matches 
			reg = Regexp.new(matches)
			assert reg.match(contains),"Response does not match #{matches}"
		end

		if headers
			assert_equal(resp.headers,headers)
		end
	end

	def test_index
		# check that we get a 404 on the / URL
		get("/foo")
		#assert_response(last_response,nil,nil,nil,404)

		# test our first GET request to /hello
		get("/")
		get("/game")
		post("/game",:action => "tell a joke!")
		get("/game")
		assert_response(last_response)

		# make sure default value work for the form
		#post("/game")
		#assert_response(last_response,nil,nil,nil,302)

		# test that we get expected values
	#	get("/game",:session[1] => Laser_weapon_armory ,:action => "tell a joke!")
	#	assert_response(last_response,"tell a joke!",nil,nil,200)
	end
end


