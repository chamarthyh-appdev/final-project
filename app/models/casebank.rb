# == Schema Information
#
# Table name: casebanks
#
#  id                 :integer          not null, primary key
#  title              :string
#  difficulty         :string
#  is_brainstorm      :boolean
#  num_exhibits       :integer
#  casebook_id        :integer
#  is_math_heavy      :string
#  case_type          :string
#  industry           :string
#  is_interviewer_led :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Casebank < ApplicationRecord
    has_many :logs, :foreign_key => "case_id"
    belongs_to :casebook
    has_many :students, :through => :logs, :source => :student
end
