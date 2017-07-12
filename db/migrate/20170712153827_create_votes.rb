class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :user
      t.integer :value

      t.timestamps
    end
  end
end
