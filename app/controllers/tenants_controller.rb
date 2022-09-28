class TenantsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    def create
        tenant = Tenant.create!(params_permit)
        render json: tenant, status: :created
    end

    def index 
        render json: Tenant.all, status: :ok
    end

    def update
        tenant = find_tenant
        tenant.update!(params_permit)
        render json: tenant, status: :ok
    end

    def destroy 
        tenant = find_tenant
        tenant.destroy
        head :no_content
    end

    private 

    def params_permit
        params.permit(:name, :age)
    end

    def find_tenant
        Tenant.find(params[:id])
    end

    def not_found_response
        render json: { error: "Tenant not found" }, status: :not_found
    end

end
