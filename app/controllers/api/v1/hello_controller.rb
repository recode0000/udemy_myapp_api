module Api
  module V1
    class HelloController < ApplicationController
      def index
        render json: 'Hello from API'
      end
    end
  end
end
