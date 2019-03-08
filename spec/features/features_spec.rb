require 'ship'
require 'port'

RSpec.describe 'features' do 
  let(:ship) { Ship.new("Carol") }
  let(:portA) { Port.new("southampton") } 
  let(:portB){ Port.new("westhampton") }
  let(:items) { {"fish" => 100, "spice" => 100, "footwear" => 50} }
  let(:destination1){ { "port" => "southampton", "fish" => 50, "spice" => 100  } }
  let(:destination2){ { "port" => "westhampton", "footwear" => 50, "fish" => 50 } }
  
  before(:each) do
    ship.add_cargo(items)
    ship.add_journey(destination1)
    ship.add_journey(destination2)
  end

describe '#add_cargo' do 
  it 'ship can take on a cargo to deliver' do 
    expect(ship.cargo).to eq [ { "fish" => 100, "spice" => 100, "footwear" => 50} ]
  end 

end

describe '#add_journey' do 
  it 'a ship can take a log of their journey' do  
    expect(ship.display_journey).to eq [destination1, destination2]
  end

end

describe '#offload_at_port' do 
  it 'when ship lands at 1 port it can offload the necessary items' do 
    ship.offload_at_port(portA)
    expect(ship.cargo).to eq  [{ "fish" => 50, "footwear"=>50}]
  end

  it 'will update cargo when docks different ports' do 
    ship.offload_at_port(portA)
    ship.offload_at_port(portB)
    expect(ship.cargo).to eq [{}]
  end
end 

end 