module Api
	class ProvidersController < ApplicationController
    MAX_LIMIT = 20

		def index
      if MS_ZIPCODES[params[:zipcode]]
        scope = Provider
          .with_provider_type(params[:provider_type])
          .order_by_closest_to(params[:zipcode])
          .limit(limit)

        render json: scope
      else
        render json: {
          error: "Please enter a valid Mississippi Zipcode"
        }
      end
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
