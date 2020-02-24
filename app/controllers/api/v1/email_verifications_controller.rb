class Api::V1::EmailVerificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_verification, only: [:show, :destroy]


  # POST /email_verifications
  def create
   @email_verification = EmailVerification.new(email_verification_params)
   if @email_verification.save
    render json: @email_verification, status: :created, location: api_v1_email_verifications_url(@email_verification)
   else
    render json: @email_verification.errors, status: :unprocessable_entity
   end
  end

  # GET /email_verifications
  def index
   @email_verifications = EmailVerification.all
   render json: @email_verifications
  end

  # GET /email_verifications/:id
  def show
    if @email_verification
      render json: @email_verification
    else
      render json: @email_verification, status: :not_found
    end
  end

  # DELETE /email_verifications/:id
  def destroy
    if @email_verification
      render json: @email_verification.destroy, status: :ok
    else
      render json: @email_verification, status: :not_found
    end
  end

  private

  def email_verification_params
    params.require(:email_verification).permit(:address,:id)
  end

  def set_verification
   @email_verification = EmailVerification.where(id: params[:id]).first
  end
end
