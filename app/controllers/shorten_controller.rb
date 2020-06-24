class ShortenController < ApplicationController

    def show
        uri = Uri.find_or_create(uri_params);      
        render json: uri.get_shorten_uri
    end

    private
    def uri_params
        params.permit(:uri)
    end 
end