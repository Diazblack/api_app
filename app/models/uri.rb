class Uri < ApplicationRecord
    validates_presence_of :uri 
    validates_uniqueness_of :uri

    def self.find_or_create(params)
        uri = Uri.find_by uri: params[:uri]
        if uri == nil
            uri = Uri.create(uri: params[:uri])
            uri.create_shorten_uri
            uri.save
        end
        uri
    end 

    def create_shorten_uri
        self.shorten_uri = SecureRandom.base64(10)
    end

    def get_shorten_uri
        hash = Hash.new(0)
        hash["shorten-uri"] = "http://localhost:8000/#{self.shorten_uri}"
        hash
    end 
end
