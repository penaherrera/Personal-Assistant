class RemindersController < ApplicationController
    before_action :require_login
  
    def index
      reminders = current_user.reminders
      render json: reminders
    end
  
    def create
      @reminder = current_user.reminders.new(reminder_params)
  
      if @reminder.save
        render json: @reminder, status: :created
      else
        render json: { errors: @reminder.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      reminder = current_user.reminders.find(params[:id])
  
      if reminder.update(reminder_params)
        render json: reminder
      else
        render json: { errors: reminder.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Reminder not found' }, status: :not_found
    end
  
    def destroy
      reminder = current_user.reminders.find(params[:id])
      reminder.destroy
      render json: { message: 'Reminder deleted successfully' }
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Reminder not found' }, status: :not_found
    end
  
    private
  
    def reminder_params
      params.require(:reminder).permit(:title, :datetime)
    end
  end
  