class Api::V1::UserEventsController < ApplicationController
    def index
        render json: UserEvent.all
    end

    def show
        render json: UserEvent.find(params[:id])
    end

    def create
        info = params[:event]
        
        if info.keys.include?('event_type') && info.keys.include?('name')

            user_event = UserEvent.new(event_type: info['event_type'], event_data: remove_event_type(params))
            user_event.save
            render json: {status: "success", code: 200, message: "User Event Created"}
        elsif 
            !info.keys.include?('event_type') && !info.keys.include?('name')
            render json: {status: "error", code: 422, message: "Missing Keys: 'event_type' and 'name'"}
        elsif 
            !info.keys.include?('event_type') && info.keys.include?('name')
            render json: {status: "error", code: 422, message: "Missing Keys: 'event_type'"}
        else 
            info.keys.include?('event_type') && !info.keys.include?('name')
            render json: {status: "error", code: 422, message: "Missing Keys: 'name'"}
        end
    end

    private

    def remove_event_type(params)
        info = params['event']
        info.delete('event_type')
        info
    end
end