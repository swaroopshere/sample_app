class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fbUser
      t.integer :current_question_id
      t.boolean :isAdmin

      t.timestamps
    end
  end
end
