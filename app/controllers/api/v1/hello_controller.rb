class Api::V1::HelloController < ApplicationController
    def index
        render json: "Hello test by Leo"
    end
end
