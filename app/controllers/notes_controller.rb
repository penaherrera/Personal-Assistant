class NotesController < ApplicationController
    before_action :require_login
    def create
        @note = current_user.notes.new(note_params)

        if @note.save
          render json: @note, status: :created
        else
          render json: { errors: @note.errors.full_messages }, status: :unprocessable_entity
        end
    end


    def note_params
        params.require(:note).permit(:title, :content)
    end
end
