require 'rails_helper'

describe List, :type => :model do
  it "has a valid factory" do
    expect(build(:list)).to be_valid
  end
  it "is invalid without a title" do
    expect(build(:list, title: nil)).to_not be_valid
  end
  it "has permissions default to private" do
    myList = List.create(title: "Veeger")
    expect(myList.permissions).to eq ("private")
  end

  xit "viewable collects lists" do

  end
end