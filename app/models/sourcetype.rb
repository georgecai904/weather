class Sourcetype < ActiveRecord::Base
  has_many :datasources
end
