class ApplicationController < ActionController::Base
    include ActionController::Cookies


    private

    def require_login
        render json: { error: 'Unauthorized' }, status: :unauthorized unless session[:user_id]
    end
end
