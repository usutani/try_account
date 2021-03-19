class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :set_expiring_sid_and_account_registration, only: %i[new create]

  # GET /accounts
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @account.email = @account_registration.email
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)
    @account.email = @account_registration.email

    if @account.save
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    def set_expiring_sid_and_account_registration
      @expiring_sid = params[:expiring_sid] || params[:account][:expiring_sid]
      @account_registration = Account::Registration.find_signed(@expiring_sid, purpose: :registration)
      head :unprocessable_entity if @account_registration.nil?
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:password, :password_confirmation)
    end
end
