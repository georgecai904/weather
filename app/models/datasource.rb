class Datasource < ActiveRecord::Base
  belongs_to :sourcetype
  belongs_to :pattern
  has_many :reports
end
