class Account::RegistrationMailer < ApplicationMailer
  def confirm
    @account_registration = params[:account_registration]
    mail(to: @account_registration.email, subject: 'Please confirm your registration')
  end
end
