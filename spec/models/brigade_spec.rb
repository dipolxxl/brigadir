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

require 'spec_helper'

describe Brigade do

  # ActiveRecord
  it { should belong_to(:country) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:cost).of_type(:integer) }
  it { should have_db_column(:workers).of_type(:integer) }
  it { should have_db_column(:country_id).of_type(:integer) }

  # ActiveModel
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should ensure_length_of(:name).is_at_least(4) }
  it { should ensure_length_of(:name).is_at_most(30) }

  it { should validate_presence_of(:cost) }
  it { should ensure_inclusion_of(:cost).in_range(0..1_000_000_000_000) }
  it { should validate_numericality_of(:cost).only_integer }

  it { should validate_presence_of(:workers) }
  it { should ensure_inclusion_of(:workers).in_range(0..1000) }
  it { should validate_numericality_of(:workers).only_integer }
end
