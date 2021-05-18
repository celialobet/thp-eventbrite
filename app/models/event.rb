class Event < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances
  belongs_to :administrator, class_name: "User"
  
  validates :start_date, 
    presence: true

    #impossible de créer ou modifier un événement dans le passé

  validates :duration, presence: true,
    numericality: { greater_than: 0}
    validate :is_a_multiple_of_5
    #doit être un multiple de 5, et est strictement positif

  validates :title,
    presence: true,
    length: { in: 5..140 }

  validates :description, 
    presence: true, 
    length: { in: 20..1000 }

  validates :price,
    presence: true,
    numericality: {greater_than: 0, less_than: 1001}
  
  validates :location, presence: true

  def is_a_multiple_of_5
    if (duration.to_i)%5 != 0
      errors.add(:duration, "La durée doit être un multiple de 5")
    end
  end

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if !start_date.blank? and start_date < Date.today
  end



  # validates :start_date, presence: true
  # validate  :start_date_cannot_be_in_the_past

  # validates :duration, presence: true, numericality: { only_integer: true }
  # validate  :multiple_of_five

  # validates :title, presence: true, length: { in: 5..140 }
  # validates :description, presence: true, length: { in: 20..1000 }
  # validates :price, presence: true, numericality: { only_integer: true, in: 1..1000 }
  # validates :location, presence: true

  

  # def start_date_cannot_be_in_the_past
  #   if start_date.present? && start_date < Date.today
  #     errors.add(:start_date, "can't be in the past")
  #   end
  # end

  # def multiple_of_five
  #   errors.add(:duration, "Invalid duration") unless
  #   duration > 0 && duration % 5 == 0
  # end

  # belongs_to :administrator, class_name: 'User'
  # has_many :attendances
  # has_many :attendees, through: :attendances 
end
