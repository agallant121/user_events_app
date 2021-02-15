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

    it "can create a new user event with necessary keys" do
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/user_events", params: '{"event" : {"name" : "test button", "event_type" : "click",    "at" : "2020-06-12T00:00:01", "button_color" : "red" }}', headers: headers

        event = UserEvent.last

        expect(response).to be_successful
        expect(UserEvent.count).to eq(1)
        expect(event.event_type).to eq('click')
    end

    it "cannot create new user event without necessary keys" do
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/user_events", params: '{"event" : {"wrong_key" : "test button", "event_type" : "click",    "at" : "2020-06-12T00:00:01", "button_color" : "red" }}', headers: headers

        event = UserEvent.last
        
        expect(response).to be_successful
        expect(UserEvent.count).to eq(0)
    end
end
