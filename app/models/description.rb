class Description < ApplicationRecord
  belongs_to :topic
  validates :desc, presence: { message: 'O campo não pode ficar em branco' }
end
