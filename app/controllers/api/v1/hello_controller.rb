module Api
	module V1
		class HelloController < ApplicationController
			render json: 'Hello by Leo'
		end
	end
end
