class Ship 

  attr_reader :name, :journey_log, :cargo
  
  def initialize(name)
    @name = name
    @journey_log = []
    @cargo = []
    
  end 

  def add_cargo(items)
    @cargo.push(items)
  end

  def add_journey(journey)
    @journey_log.push(journey)
  end

  def display_journey
    @journey_log
  end 

  def offload_at_port(port)
    log = @journey_log.select do |log| 
       port.name == log["port"] 
    end
    update_cargo(log)
  end

  def update_cargo(log)
    log.each{|h| h.delete("port")}
    @cargo = [ @cargo[0].merge(log[0]) { |key, oldv, newv| oldv-newv } ]
      remove_zeroed_items(@cargo)
    end 

  def remove_zeroed_items(cargo)
    cargo.each do |hash|
      hash.delete_if {|k, v| v == 0 }
      end
  end
end 

