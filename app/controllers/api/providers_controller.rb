module Api
	class ProvidersController < ApplicationController
    MAX_LIMIT = 20

		def index
		  scope = Provider
        .with_provider_type(params[:provider_type])
        .order_by_closest_to(params[:zipcode])
        .limit(limit)

		  render json: scope
		end

    private

    def limit
      if params[:limit].to_i < MAX_LIMIT
        params[:limit] || MAX_LIMIT
      else
        MAX_LIMIT
      end
    end

	end
end
