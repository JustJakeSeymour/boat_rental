require './lib/dock'
require './lib/renter'
require './lib/boat'

RSpec.describe Dock do
  let!(:dock) {Dock.new("The Rowing Dock", 3)}
  
  it 'gets a name and a max rental time' do
    expect(dock.name).to eq "The Rowing Dock"
    expect(dock.max_rental_time).to eq 3
  end
  
  it 'has a rent method that takes a boat and a renter' do
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    sup_1 = Boat.new(:stanup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(sup_1, eugene)
    expect(dock.rental_log).to be_a_kind_of Hash
  end
  
  it 'has a charge method that accepts a boat, returns a hash with card_number & amount as keys' do
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    sup_1 = Boat.new(:stanup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(sup_1, eugene)
    expect(dock.charge(kayak_1)).to be_a_kind_of Hash
  end
  describe IterationFour do
    !let(:kayak_1) {Boat.new(:kayak, 20)}
    !let(:kayak_2) {Boat.new(:kayak, 20)}
    !let(:sup_1) {Boat.new(:stanup_paddle_board, 15)}
    !let(:patrick) {Renter.new("Patrick Star", "4242424242424242")}
    !let(:eugene) {Renter.new("Eugene Crabs", "1313131313131313")}

    it 'returns boats' do
      dock.rent(kayak_1, patrick)
      dock.rent(kayak_2, patrick)
      
    end
    
  end
end