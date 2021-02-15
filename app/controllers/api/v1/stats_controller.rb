class Api::V1::StatsController < ApplicationController
    def index
        now = Time.now
        events = UserEvent.where(created_at: (now - 24.hours)..now)
        stats = events.group(:event_type).count
        render json: "todays_stats : #{stats}"
    end
end