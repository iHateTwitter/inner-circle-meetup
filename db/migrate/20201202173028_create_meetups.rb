class CreateMeetups < ActiveRecord::Migration[6.0]
  def change
    create_table :meetups do |t|
      t.references :host, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.text :description
      t.string :url
      t.string :meetup_type
      t.integer :participants_limit

      t.timestamps
    end
  end
end
