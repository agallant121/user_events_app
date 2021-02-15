class Api::V1::UserEventsController < ApplicationController
    def index
        render json: UserEvent.all
    end

    def show
        render json: UserEvent.find(params[:id])
    end
end