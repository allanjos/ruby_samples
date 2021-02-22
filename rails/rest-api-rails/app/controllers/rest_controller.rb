class RestController < ApplicationController
    include ActionController::HttpAuthentication::Basic::ControllerMethods

    http_basic_authenticate_with name: "admin", password: "12345"

    def index
        response = '{"resource": "home"}'

        render json: response, status: :ok
    end

    def users
        puts("users()")

        response = '{"resource": "users"}'

        render json: response, status: :ok
    end
end