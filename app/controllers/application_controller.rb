class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordInvalid, with: :invalid_response

    private

    def invalid_response(e)
        render json: { errors: e.record.errors.full_messages }, status: :invalid
    end
    
end
