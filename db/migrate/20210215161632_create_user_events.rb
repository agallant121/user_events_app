class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events do |t|
      t.integer :event_type
      t.json :event_data

      t.timestamps
    end
    add_index :user_events, :event_type
  end
end
