class Building < ApplicationRecord
  belongs_to :client
  has_many :building_custom_fields
  has_many :custom_fields, through: :building_custom_fields

  validates :address, :state, :zip, presence: true
  # validate :custom_fields_validation

  # def custom_fields_validation
  #   client.custom_fields.each do |field|
  #     value = self.custom_fields[field.name]
  #     case field.field_type
  #     when 'number'
  #       errors.add(field.name, 'must be a number') unless value.is_a?(Numeric)
  #     when 'freeform'
  #       errors.add(field.name, 'must be a string') unless value.is_a?(String)
  #     when 'enum'
  #       errors.add(field.name, 'is not included in the list') unless field.values.include?(value)
  #     end
  #   end
  # end
end
