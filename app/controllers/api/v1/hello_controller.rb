module Api
  module V1
    class HelloController < ApplicationController
      def index
				render json: "Hello world"
		  end
		end
	end
end
