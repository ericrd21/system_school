class Attendance < ApplicationRecord
  belongs_to :class_school
  belongs_to :student
end
