require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  it { should validate_presence_of :event_type }
  it { should validate_presence_of :event_data }
end
