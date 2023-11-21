class ApplicationController < ActionController::Base
    include ActionController::Cookies
    skip_before_action :verify_authenticity_token


    private

    def require_login
        token = request.headers['Authorization']&.sub('Bearer ', '')
        user = User.find_by(id: token)
        render json: { error: 'Unauthorized' }, status: :unauthorized unless user
    end

    def current_user
        token = request.headers['Authorization']&.sub('Bearer ', '')
        User.find_by(id: token)
    end
end
