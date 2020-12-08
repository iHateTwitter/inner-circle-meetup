class CreateAvoidances < ActiveRecord::Migration[6.0]
  def change
    create_table :avoidances do |t|
      t.references :user, null: false, foreign_key: true
      t.string :reason
      t.references :target, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
