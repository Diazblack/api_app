class RootController < ApplicationController
    def show             
        @uri = Uri.find_by(shorten_uri: root_params)        
        render json: FetchPage.new(@uri.uri).get_body 
    end

    private 

    def root_params
        params.keys[0]
    end 


end