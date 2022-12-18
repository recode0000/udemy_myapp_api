module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: users.as_json(only: [
          :id,
          :name,
          :email,
          :created_at
        ])
      end
    end
  end
end