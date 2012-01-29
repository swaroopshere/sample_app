class Option < ActiveRecord::Base
  belongs_to :question
  
  def to_param
    "#{self.id}-#{self.text.downcase.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
