class Account::RegistrationsController < ApplicationController
  before_action :set_account_registration, only: [:show, :edit, :update, :destroy]

  # GET /account/registrations
  def index
    @account_registrations = Account::Registration.all
  end

  # GET /account/registrations/1
  def show
  end

  # GET /account/registrations/new
  def new
    @account_registration = Account::Registration.new
  end

  # GET /account/registrations/1/edit
  def edit
  end

  # POST /account/registrations
  def create
    @account_registration = Account::Registration.new(account_registration_params)

    if @account_registration.save
      redirect_to @account_registration, notice: 'Registration was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /account/registrations/1
  def update
    if @account_registration.update(account_registration_params)
      redirect_to @account_registration, notice: 'Registration was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /account/registrations/1
  def destroy
    @account_registration.destroy
    redirect_to account_registrations_url, notice: 'Registration was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_registration
      @account_registration = Account::Registration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_registration_params
      params.require(:account_registration).permit(:email)
    end
end
