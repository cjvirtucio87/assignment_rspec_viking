# warmup_spec.rb
require 'warmup'

describe Warmup do

  let(:warmup){ Warmup.new }

  describe '#gets_shout' do
    it 'accepts user input' do
      expect(warmup).to receive(:gets).and_return("")
      warmup.gets_shout
    end
    
    it 'prints out user input' do
      allow(warmup).to receive(:gets).and_return("UPPERCASE")
      expect(warmup).to receive(:puts).and_return(nil)
      warmup.gets_shout
    end
  end

  describe '#triple_size' do
    it 'takes an array input and returns the size times 3' do
      arr = double("Array", :size => 3)
      expect(warmup.triple_size(arr)).to eq(9)
    end
  end

  describe '#calls_some_methods' do
    let(:str){"lowercase"}

    it 'upcases a string argument' do
      expect(str).to receive(:upcase!).and_return("LOWERCASE")
      warmup.calls_some_methods(str)
    end

    it 'reverses a string argument' do
      expect(str).to receive(:reverse!).and_return("ESACREWOL")
      warmup.calls_some_methods(str)
    end

    it 'returns a different string' do
      expect(warmup.calls_some_methods(str)).not_to eq(str)
    end
  end
end
