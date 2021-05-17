class User < ApplicationRecord
  has_many :events, foreign_key: 'administrator_id', class_name: 'Event'
  has_many :attendances, foreign_key: 'attendee_id', class_name: 'Attendance'
end
