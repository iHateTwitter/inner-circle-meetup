# frozen_string_literal: true

class Avoidance < ApplicationRecord
  belongs_to :user
  belongs_to :target, class_name: "User"
end
