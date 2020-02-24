class EmailAddress < ApplicationRecord
  has_many :email_verifications
  before_create :set_verification_status

  def check_status
    'valid'
  end

  private

  def set_verification_status
    self.status = check_status
  end
end
