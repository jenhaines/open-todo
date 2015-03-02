require 'rails_helper'

describe Item, type: :model do
  it "has a valid factory" do
    expect(build(:item)).to be_valid
  end

  it "is invalid without a description" do
    expect(build(:item, description: nil)).to_not be_valid
  end

  it "has a completed field that defaults to false" do
    expect(build(:item).completed).to eq(false)
  end

  xit "completed? returns only completed items" do
  end

end