require 'ship'


RSpec.describe Ship do 
  let(:ship){ described_class.new("Lucinda") }
  let(:items) { {"fish" => 100 } }
  let(:journey) { { "port" => "southampton", "fish" => 50 } }
  let(:port) { object_double(Port.new("southampton"), :name =>  "southampton") }

  before(:each) do 
    ship.add_cargo(items)
    ship.add_journey(journey)
  end 

  describe '#add_cargo' do 
    it 'can add cargo' do 
      expect(ship.cargo).to eq [{"fish" => 100 }]
    end 
  end

  describe '#add_journey' do 
    it 'can add one journey' do 
      expect(ship.journey_log).to eq [{ "port" => "southampton", "fish"=> 50 }]
    end
  end 

  describe '#offload_at_port' do 
    it 'can offload items that are expected at the port' do 
      ship.offload_at_port(port)
      expect(ship.cargo).to eq [{ "fish" => 50 }]
    end
  end 

end 