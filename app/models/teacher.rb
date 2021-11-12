class Teacher < ApplicationRecord
  belongs_to :discipline
  belongs_to :user
end
