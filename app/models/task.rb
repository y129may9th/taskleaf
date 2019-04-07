class Task < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }
    validate :validate_name_not_include_comma

    belongs_to :user

    scope :recent, -> { order(created_at: :desc) }

    private 

    def validate_name_not_include_comma
        errors.add(:name, ' : Do not include comma in "name form"') if name&.include?(',')
    end
end

