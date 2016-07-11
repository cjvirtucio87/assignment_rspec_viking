require_relative '../lib/weapons/bow'

describe Bow do
  describe "#arrows" do
    it "returns a fixed number" do
      expect(Bow.new.arrows).to be_an_instance_of(Fixnum)
    end

    it "returns 10 as the default arrow count" do
      bow = Bow.new
      expect(Bow.new.arrows).to eq(10)
    end

    it "returns the specified number of arrows" do
      expect(Bow.new(32132).arrows).to eq(32132)
    end
  end

  describe "#use" do
    it "reduces the arrow count by 1" do
      bow = Bow.new
      bow.use
      expect(bow.arrows).to eq(9)
    end

    it "cannot be called when arrow count is zero" do
      bow = Bow.new(0)
      expect{ bow.use }.to raise_error("Out of arrows")
    end

  end
end