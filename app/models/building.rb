class Building < ApplicationRecord
  belongs_to :client
  has_many :building_custom_fields, dependent: :destroy
  has_many :custom_fields, through: :building_custom_fields

  validates :address, :state, :zip, presence: true
  validates :address, uniqueness: { scope: [:state, :zip], message: "should be unique per state and zip" }
end
