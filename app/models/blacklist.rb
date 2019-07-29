class Blacklist < ApplicationRecord
  has_many :topics
  has_many :descriptions
  validates :word, presence: { message: 'O campo não pode ficar em branco' },
                   uniqueness: { message: 'Essa palavra já existe',
                                 case_sensitive: false }
end
