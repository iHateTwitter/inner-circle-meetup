class Meetup < ApplicationRecord
  belongs_to :host, class_name: 'User'

  has_many :participations
  has_many :participants, source: :user, through: :participations
end
