class Signup < ApplicationRecord
  validates :time, inclusion: {in: 0..23}
  validates :camper_id, numericality: { only_integer: true }
  validates :activity_id, numericality: { only_integer: true }
  belongs_to :activity
  belongs_to :camper
end
