class ApartmentsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    def create
        apartment = Apartment.create!(params_permit)
        render json: apartment, status: :created
    end

    def index 
        render json: Apartment.all, status: :ok
    end

    def update
        apartment = find_apartment
        apartment.update!(params_permit)
        render json: apartment, status: :ok
    end

    def destroy 
        apartment = find_apartment
        apartment.destroy
        head :no_content
    end

    private 

    def params_permit
        params.permit(:number)
    end

    def find_apartment
        Apartment.find(params[:id])
    end

    def not_found_response
        render json: { error: "Apartment not found" }, status: :not_found
    end

end
