module Api
  module V1
    class HelloController < ApplicationController
      def index
        render json: 'Hello by Leo'
      end
    end
  end
end
