require 'port'

RSpec.describe Port do
    let(:port){ described_class.new("Southampton") }

    describe '#new' do 
    
      it 'can take a name' do
      expect(port.name).to eq "Southampton"
      
    end 
  end 
end