class Api::V1::UserEventsController < ApplicationController
    before_action :information, only: [:create, :remove_event_type, :inc_event_type, :inc_name]

    def index
        render json: UserEvent.all
    end

    def show
        render json: UserEvent.find(params[:id])
    end

    def create        
        if inc_event_type && inc_name
            user_event = UserEvent.new(event_type: information['event_type'], event_data: remove_event_type)
            user_event.save
            json_message('success', 200, 'User Event Created')
        elsif 
            !inc_event_type && !inc_name
            json_message('error', 422, 'Missing Keys: event_type and name')
        elsif 
            !inc_event_type && inc_name
            json_message('error', 422, 'Missing Keys: event_type')

        else 
            inc_event_type && !inc_name
            json_message('error', 422, 'Missing Keys: name')
        end
    end

    private

    def remove_event_type
        information.delete('event_type')
        information
    end

    def inc_event_type
        information.keys.include?('event_type')
    end

    def inc_name
        information.keys.include?('name')
    end

    def json_message(status, code, message)
        render status: "#{code}", json: {code: "#{status}", status: "#{code}", message: "#{message}"}
    end

    def information
        params['event']
    end
end