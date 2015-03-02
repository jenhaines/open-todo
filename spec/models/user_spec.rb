require 'rails_helper'

describe User, type: :model do
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

  describe "can edit?" do
    let(:myuser) { create(:user) }
    it "returns true when User owns list" do
      mylist = create(:list, user: myuser)
      expect(myuser.can?("edit", mylist)).to eq(true)
    end
    it "returns true when List is Open" do
      mylist = create(:list, permissions: "open")
      expect(myuser.can?("edit", mylist)).to eq(true)
    end
    it "returns false when List is private" do
      mylist = create(:list, permissions: "private")
      expect(myuser.can?("edit", mylist)).to eq(false)
    end
    it "returns false when List is visible" do
      mylist = create(:list, permissions: "visible")
      expect(myuser.can?("edit", mylist)).to eq(false)
    end

  end

  describe "can view?" do
    let(:myuser) { create(:user) }
    it "returns true when User owns list" do
      mylist = create(:list, user: myuser)
      expect(myuser.can?("view", mylist)).to eq(true)
    end
    it "returns true when List is Open" do
      mylist = create(:list, permissions: "open")
      expect(myuser.can?("view", mylist)).to eq(true)
    end
    it "returns true when List is visible" do
      mylist = create(:list, permissions: "visible")
      expect(myuser.can?("view", mylist)).to eq(false)
    end
    it "returns false when List is private" do
      mylist = create(:list, permissions: "private")
      expect(myuser.can?("view", mylist)).to eq(false)
    end

  end


end