# == Schema Information
#
# Table name: casebooks
#
#  id            :integer          not null, primary key
#  casebook_name :string
#  url           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Casebook < ApplicationRecord
    has_many :mockcases, :class_name => "Casebank", :dependent => :destroy
end
