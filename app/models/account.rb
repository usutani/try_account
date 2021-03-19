class Account < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 8..30 },
                       format: { with: /\A[a-z0-9]+\z/i,
                                 message: 'は半角英数とハイフン（-）のみお使いください。' }
 end
