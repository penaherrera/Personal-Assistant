class UsersController < ApplicationController
    before_action :require_login, except: [:create, :login]
  
    def create
      user = User.new(user_params)
  
      if user.save
        render json: { message: 'User created successfully' }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  

    def login
      user = User.find_by(username: params[:username])
    
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: { token: session[:user_id], message: 'Login successful' }
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end
  
    def logout
      session[:user_id] = nil
      render json: { message: 'Logout successful' }
    end
    
    private
  
    def user_params
      params.require(:user).permit(:username, :password)
    end
    

end
  