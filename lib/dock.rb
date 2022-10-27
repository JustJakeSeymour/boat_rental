class Dock

  attr_reader :name,
              :max_rental_time,
              :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    rental_log[boat] = renter
  end
  
  def charge(boat)
    { 
      :card_number => @rental_log[boat].credit_card_number,
      :amount      => rented_boat_price_per_hour(boat) * rented_boat_hours_rented(boat)
    }
  end

  def return(boat)
    
  end
  
  def log_hour
    rental_log.map.add_hour
  end

  def revenue
    # sum charge_all[amount]
  end

  private

  def rented_boat_price_per_hour(boat)
    @rental_log.key(@rental_log[boat]).price_per_hour
  end

  def rented_boat_hours_rented(boat)
   if 
    @rental_log.key(@rental_log[boat]).hours_rented > max_rental_time
    return max_rental_time
   else
    return rental_log.key(@rental_log[boat]).hours_rented
   end
  end

end