class LeasesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    def create
        lease = Lease.create!(params_permit)
        render json: lease, status: :created
    end

    def destroy 
        lease = find_lease
        lease.destroy
        head :no_content
    end

    private

    def params_permit
        params.permit(:rent)
    end

    def find_lease
        Lease.find(params[:id])
    end

    def not_found_response
        render json: { error: "Lease not found" }, status: :not_found
    end
end
