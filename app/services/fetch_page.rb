class FetchPage
    def initialize(data)
        @filter = data
    end

    def get_body
        get_json(@filter)
    end 

    private

    def get_json(uri)
        response = conn(uri).get() 
        response.body
    end

    def conn(uri)
        Faraday.new(url: uri) do |f|
            f.headers['Accept'] = 'application/json'
            f.adapter Faraday.default_adapter
        end
    end
end