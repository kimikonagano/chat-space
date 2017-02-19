require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with a message" do
    message = build(:message, text: "hmhm")
    expect(message).to be_valid
    end
  end

  describe '#create' do
    it "is invalid without a message" do
    message = build(:message, text: "")
    message.valid?
    expect(message.errors[:text]).to include("can't be blank")
    end
  end
end
