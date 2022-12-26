module Api
  module V1
    module Auth
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
        private

        def sign_up_params
          params.require(:registration).permit(:name, :email, :password)
        end
      end
    end
  end
end