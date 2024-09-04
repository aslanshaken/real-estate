class CustomField < ApplicationRecord
  belongs_to :client
  has_many :building_custom_fields
  has_many :buildings, through: :building_custom_fields

  validates :name, :field_type, presence: true
  validates :field_type, inclusion: { in: %w[number freeform enum] }
end
