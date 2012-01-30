class ChangeQuestionFieldNameSequenceNumber < ActiveRecord::Migration
  def up
    rename_column :questions, :sequenceNumber, :sequencenumber
  end

  def down
  end
end
