class CustomField < ApplicationRecord
  belongs_to :client
  
  validates :name, :field_type, presence: true
  validates :field_type, inclusion: { in: %w[number freeform enum] }
end
