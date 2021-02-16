require 'rails_helper'

describe "User Events API" do
    before :each do 
        UserEvent.destroy_all
        @header = { "CONTENT_TYPE" => "application/json" }
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

        post "/api/v1/user_events", params: '{"event" : {"name" : "test button", "event_type" : "click",    "at" : "2020-06-12T00:00:01", "button_color" : "red" }}', headers: @header

        event = UserEvent.last

        expect(response).to be_successful
        expect(response).to have_http_status(200)
        expect(UserEvent.count).to eq(1)
        expect(event.event_type).to eq('click')
    end

    it "cannot create new user event without necessary name key" do

        post "/api/v1/user_events", params: '{"event" : {"wrong_key" : "test button", "event_type" : "click",    "at" : "2020-06-12T00:00:01", "button_color" : "red" }}', headers: @header

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response).to have_http_status(422)
        expect(UserEvent.count).to eq(0)
        expect(body[:message]).to eq("Missing Keys: name")
    end

    it "cannot create new user event without necessary event_type key" do

        post "/api/v1/user_events", params: '{"event" : {"name" : "test button", "wrong_key" : "click",    "at" : "2020-06-12T00:00:01", "button_color" : "red" }}', headers: @header

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response).to have_http_status(422)
        expect(UserEvent.count).to eq(0)
        expect(body[:message]).to eq("Missing Keys: event_type")
    end

    it "cannot create new user event without necessary event_type and name keys" do

        post "/api/v1/user_events", params: '{"event" : {"wrong_key1" : "test button", "wrong_key2" : "click",    "at" : "2020-06-12T00:00:01", "button_color" : "red" }}', headers: @header

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response).to have_http_status(422)
        expect(UserEvent.count).to eq(0)
        expect(body[:message]).to eq("Missing Keys: event_type and name")
    end
end
