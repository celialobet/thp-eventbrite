class Event < ApplicationRecord
  validates :start_date, 
    presence: true 
  validates :duration, 
    presence: true, 
    numericality: { only_integer: true, :greater_than => 0 }, 
    :multiple_of_five
  validates :title, 
    presence: true, 
    length: { in: 5..140 }
  validates :description, 
    presence: true, 
    length: { in: 20..1000 }
  validates :price, 
    presence: true,
    numericality: { only_integer: true, in: 1..1000 }
  validates :location, 
    presence: true

  before_create :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def multiple_of_five
    errors.add(:duration, "Invalid duration") unless
    duration % 5 == 0
  end

  belongs_to :administrator, class_name: 'User'
  has_many :attendances
end
