# == Schema Information
#
# Table name: logs
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  case_id       :integer
#  given_by      :string
#  feedback      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  practice_date :date
#

class Log < ApplicationRecord
    belongs_to :student, :class_name => "User"
    belongs_to :case, :required => false, :class_name => "Casebank"
    
    validates :given_by, presence: true
end
