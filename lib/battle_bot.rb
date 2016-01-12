class BattleBot

  attr_reader :name, :health, :enemies, :weapon
  

  def initialize(str,health=100)
      @name = str     
      @health = health
      @enemies = Array.new
      @weapon = nil
      @dead = false
  end

  def dead?
    @dead
  end  


  def has_weapon?
    @weapon ? true : false 
  end  

  def pick_up(my_weapon)
      raise ArgumentError if !my_weapon.is_a?(Weapon)
      #raise ArgumentError if 
      if !self.has_weapon?
          @weapon = my_weapon
      end    
  end

  private
  def weapon= (my_weapon)
    @weapon = my_weapon
  end 



end  