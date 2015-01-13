class Report < ActiveRecord::Base
  has_and_belongs_to_many :information
  belongs_to :user
end
