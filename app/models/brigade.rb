class Brigade < ActiveRecord::Base
  belongs_to :country
  attr_accessible :cost, :name, :workers

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
