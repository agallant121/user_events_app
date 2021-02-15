class UserEvent < ApplicationRecord
    validates_presence_of :event_type, presence: true
    validates_presence_of :event_data, presence: true

    enum event_type: [:'click', :'view' ]
end
