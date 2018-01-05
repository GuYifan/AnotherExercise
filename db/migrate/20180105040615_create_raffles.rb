class CreateRaffles < ActiveRecord::Migration[5.1]
  def change
    create_table :raffles do |t|
      t.integer :user_id
      t.boolean :win, default: false

      t.timestamps
    end

    add_column :users, :wins_count, :integer, default: 0
  end
end
