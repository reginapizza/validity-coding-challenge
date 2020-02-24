class MainController < ApplicationController
  def home
    if !params[:address].blank?
      valid = EmailAddress.new(address: params[:address].to_s).check_status
      flash.now[:success] = valid ? "Email is valid!" : "Email is not valid!"
    end
  end
end
