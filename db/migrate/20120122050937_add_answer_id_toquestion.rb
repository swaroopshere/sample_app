class AddAnswerIdToquestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :correctAnswer_id, :integer
  end

  def self.down
    remove_column :questions, :correctAnswer_id
  end
end
