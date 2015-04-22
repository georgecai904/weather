class Report < ActiveRecord::Base
  belongs_to :station
  belongs_to :datasource
  belongs_to :period
end
