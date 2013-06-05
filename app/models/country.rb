# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ActiveRecord::Base
  has_many :brigades, dependent: :destroy
  attr_accessible :name

  validates :name, presence:   true,
                   uniqueness: true,
                   length:     (3..100)
end
