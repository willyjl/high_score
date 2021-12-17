class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.float :highest_score
      t.float :average_score
      t.float :lowest_score

      t.timestamps
    end
  end
end
