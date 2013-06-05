require 'spec_helper'

describe Brigade do

  # ActiveRecord
  it { should belong_to(:country) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:cost).of_type(:integer) }
  it { should have_db_column(:workers).of_type(:integer) }

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
