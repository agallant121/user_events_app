require 'rails_helper'

describe "User Events API" do
    before :each do 
        UserEvent.destroy_all
    end
    
    it "can get all user events" do
        create_list(:user_event, 5)
        
        get "/api/v1/user_events"
        
        expect(response).to be_successful
        
        events = JSON.parse(response.body, symbolize_names: true)
        expect(events.size).to eq(5)
    end

    it "can get a user_event by its id" do
        id = create(:user_event).id

        get "/api/v1/user_events/#{id}"

        event = JSON.parse(response.body, symbolize_names: true)
        
        expect(response).to be_successful
        expect(event[:id]).to eq(id)
    end
end