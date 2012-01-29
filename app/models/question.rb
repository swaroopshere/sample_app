class Question < ActiveRecord::Base
  has_many :options
  validates :text, :presence => true
  
  def to_param
    "#{self.id}-#{self.text.downcase.gsub(/[^a-z0-9]+/i, '-')}"
  end

end
