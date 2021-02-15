FactoryBot.define do
  factory :user_event do
    event_type { 1 }
    event_data { '{"event" : {"name" : "test button", "event_type" : ["click", "view"].shuffle.pop, "at" : "2020-06-12T00:00:01", "button_color" : "red" }}' }
  end
end
