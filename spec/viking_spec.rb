require 'viking'

describe Viking do

  describe "#initialize" do
    let(:axe){ Axe.new }
    let(:bow){ Bow.new }
    let(:vik){ Viking.new("Vik") }

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

  describe "#pick_up_weapon" do
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

  describe "#drop_weapon" do 
    it "dropping a viking's weapon leaves him weaponless" do
      vik.pick_up_weapon(axe)
      vik.drop_weapon
      expect(vik.weapon).to eq(nil)
    end
  end

  describe "#receive_attack" do
    it "takes a fixed number and changes the viking's health by that number" do
      vik.receive_attack(10)
      expect(vik.health).to eq(90)
    end

    it "calls the take_damage method" do
      expect(vik).to receive(:take_damage).with(10).and_return(vik.health)
      vik.receive_attack(10)
    end
  end

  describe "#attack" do
    let(:enemy) { Viking.new("Enemy") }
    it "causes the recipient's health to drop" do
      vik.pick_up_weapon(bow)
      vik.attack(enemy)
      expect(enemy.health).to eq(80)
    end

    it "calls the recipient's take_damage method" do
      expect(enemy).to receive(:take_damage).with(2.5).and_return(enemy.health)
      vik.attack(enemy)
    end

    it "runs damage with fists when the viking has no weapon" do
      vik.attack(enemy)
      expect(enemy.health).to eq(97.5)
    end

    it "reduces the enemy's health by the weapon's 
        multiplier times the attacker's strength" do
      multi = Fists.new.use
      strength = vik.strength
      vik.attack(enemy)
      expect(100-enemy.health).to eq(strength * multi)
    end
  end

end
end
