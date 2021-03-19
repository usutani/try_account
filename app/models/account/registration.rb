class Account::Registration < ApplicationRecord
  validates :email, presence: true
  validate :email_of_account_is_unique
  validates :terms_of_service, acceptance: true

  private
    def email_of_account_is_unique
      errors.add(:email, 'は既に使用されています。') if Account.find_by(email: email)
    end
end 
