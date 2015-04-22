class Period < ActiveRecord::Base
  has_many :reports

  def to_s
    "#{Time.at(self.datetime)}"
  end
end
