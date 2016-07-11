require 'viking'

describe Viking do

  describe "#initialize" do
    let(:axe){ Axe.new }
    let(:bow){ Bow.new }

    it "sets the viking's name to the argument passed to it" do
      expect(Viking.new("Vik").name).to eq("Vik")
    end

    it "sets the viking's health to default value" do
      expect(Viking.new("Vik").health).to eq(100)
    end

    it "sets the viking's health to argument value" do
      expect(Viking.new("Vik", 200).health).to eq(200)
    end

    it "can't overwrite its health after its been set on initialize" do
      expect { Viking.new("Vik", 200).health = 100 }
        .to raise_error(NoMethodError)
    end

     it "doesn't have a weapon when first initialized" do
       expect(Viking.new("Vik", 200).weapon).to eq(nil)
     end

     it "gives the viking a weapon" do
       expect(Viking.new("Vik").pick_up_weapon(axe)).to eq(axe)
     end

     it "replaces the viking's current weapon" do
       expect(Viking.new("Vik").pick_up_weapon(axe)).to eq(axe)
       expect(Viking.new("Vik").pick_up_weapon(bow)).to eq(bow)
     end

     it "raises an error if it picks up a non-weapon" do
       expect{ Viking.new("Vik").pick_up_weapon("axe") }
         .to raise_error("Can't pick up that thing") 
     end

  end

end
