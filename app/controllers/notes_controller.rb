class NotesController < ApplicationController
    before_action :require_login
    
    def index
      notes = current_user.notes
      render json: notes
    end
    
    def create
        @note = current_user.notes.new(note_params)

        if @note.save
          render json: @note, status: :created
        else
          render json: { errors: @note.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
      note = current_user.notes.find(params[:id])
  
      if note.update(note_params)
        render json: note
      else
        render json: { errors: note.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Note not found' }, status: :not_found
    end


    def destroy
      note = current_user.notes.find(params[:id])
      note.destroy
      render json: { message: 'Note deleted successfully' }
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Note not found' }, status: :not_found
    end

    def note_params
        params.require(:note).permit(:title, :content)
    end
end
