# == Schema Information
#
# Table name: brigades
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  workers    :integer          default(0), not null
#  cost       :integer          default(0), not null
#  country_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Brigade < ActiveRecord::Base
  belongs_to :country
  acts_as_taggable

  attr_accessible :cost, :name, :workers, :country_id, :tag_list

  validates :name, presence:   true,
                   uniqueness: true,
                   length:     (4..30)

  validates :cost, presence: true,
                   numericality: { only_integer: true },
                   inclusion: { in: 0..1_000_000_000_000 }

  validates :workers, presence: true,
                      numericality: { only_integer: true },
                      inclusion: { in: 0..1000 }
end
