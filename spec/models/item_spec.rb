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
  describe "Completed items" do
    let(:item1) { create(:item, completed: true)}
    let(:item2) { create(:item)}

    it "returns only completed items" do
      expect(item1).to be_completed
    end

    it "does not return incomplete items" do
      expect(item2).to_not be_completed
    end

  end

end