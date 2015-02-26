require 'rails_helper'

describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end
  it "is invalid without an email" do
    expect(build(:user, email: nil)).to_not be_valid
  end
  it "is invalid without a username" do
    expect(build(:user, username: nil)).to_not be_valid
  end
  it "must have unique email" do
    copy_cat = create(:user)
    expect(build(:user, username: "jerry", email: "me@example.com")).to_not be_valid
  end
  it "must have unique username" do
    copy_cat = create(:user)
    expect(build(:user, username: "booger", email: "me2@example.com")).to_not be_valid
  end
end