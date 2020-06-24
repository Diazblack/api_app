class RootController < ApplicationController
    def show             
        @uri = Uri.find_by(shorten_uri: params[:shorten_uri])        
        render json: FetchPage.new(@uri.uri).get_body 
    end
end