class Accounts::FreezesController < ApplicationController
  def index
    @accounts = Account.joins(:freeze).where.not(freeze: nil).order(:id)
  end

  def create
    Account.find(params[:account_id]).create_freeze
    redirect_to accounts_url
  end

  def destroy
    Account::Freeze.where(account_id: params[:account_id]).destroy_all
    redirect_to accounts_url
  end
end
