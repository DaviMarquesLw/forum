class Topic < ApplicationRecord
  has_many :descriptions
  validates :title, presence: { message: 'Você deve informar um tópico ' },
                    uniqueness: { message: 'Esse tópico já existe',
                                  case_sensitive: false }
end
