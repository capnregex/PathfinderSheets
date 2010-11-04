class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  belongs_to :race
  belongs_to :cclass
  belongs_to :alignment
  belongs_to :size
  belongs_to :gender
end
