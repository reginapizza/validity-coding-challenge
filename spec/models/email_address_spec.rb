require "rails_helper"

describe EmailAddress, :type => :model do
  describe "check_status" do

    let(:valid_address) {Faker::Internet.email}
    let(:invalid_address) {'not_an_email'}

    context "when email address is valid" do
      subject(:email_address) {EmailAddress.new(address: valid_address)}

      it "returns valid" do
        expect(email_address.check_status).to eq('valid')
      end
    end

    context "when email address is invalid" do
      subject(:email_address) {EmailAddress.new(address: invalid_address)}

      it "returns false" do
        expect(email_address.check_status).to eq('invalid')
      end
    end

  end
end
