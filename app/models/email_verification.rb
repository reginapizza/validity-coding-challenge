class EmailVerification < ApplicationRecord
  before_validation :set_up_email_record
  before_create :set_verification_status
  belongs_to :email_address

  private

  def set_up_email_record
    self.email_address = EmailAddress.find_or_create_by(
      {address: self.address}) do | e |
        e.address = address
    end
  end

  def set_verification_status
    self.verification_status = self.email_address.status
  end

end
