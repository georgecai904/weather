class Station < ActiveRecord::Base
  has_many :reports

  def to_s
    "#{self.name}"
  end
end
