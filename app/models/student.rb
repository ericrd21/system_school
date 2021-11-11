class Student < ApplicationRecord
  belongs_to :user
  belongs_to :class_school
end
