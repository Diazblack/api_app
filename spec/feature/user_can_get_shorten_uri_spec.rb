require 'rails_helper'

RSpec.describe "shorten uri API", type:'request' do
    before do
        @uri = Uri.create({uri: "http://example.com/", shorten_uri: "u/h9V2-7Wp0"})
    end
    context "When I send GET request with a whole URL " do
        it "I should receive an Object with a shorten URI" do
            get "/shorten/", params: "uri=http%3A%2F%2Fexample.com%2F/1"
            
            expect(response).to be_successful

            body = JSON.parse(response.body)
            
            expect(body).to have_key("shorten-uri")   
        end 

        it "Should receive the same object if the uri already exist" do
            get "/shorten/", params: "uri=http%3A%2F%2Fexample.com%2F"
            
            expect(response).to be_successful

            body = JSON.parse(response.body)
            
            expect(body).to have_key("shorten-uri")
            expect(body["shorten-uri"]).to eq(@uri.get_shorten_uri["shorten-uri"])
            
        end 
    end  
end