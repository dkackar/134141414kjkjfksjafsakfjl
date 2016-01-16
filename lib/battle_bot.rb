require 'weapon.rb'

class BattleBot
  
  @@count = 0

  attr_reader :name, :health, :enemies, :weapon

  def initialize(str,health=100)
      @name = str     
      @health = health
      @enemies = Array.new
      @weapon = nil
      @dead = false
      @@count += 1
  end

  def self.count
    @@count
  end

  def dead?
    @dead
  end  

  def has_weapon?
    !!@weapon
  end

  def pick_up(weapon)
    raise ArgumentError if !weapon.is_a?(Weapon)
    raise ArgumentError if weapon.picked_up? && @weapon != weapon
 
    if !has_weapon?
      @weapon = weapon 
      @weapon.picked_up = true
      @weapon.bot = self
      @weapon
    end
  end

  def drop_weapon
    @weapon.bot = nil
    @weapon = nil
  end 

  def take_damage(damage)
    raise ArgumentError if !damage.is_a?(Fixnum)
    @health - damage >= 0 ? (@health -= damage) : @health = 0
    @@count -= 1 if health == 0
    @health

  end

  def heal
    return if @health == 0 
    @health + 10 <= 100 ? (@health += 10) : @health = 100
  end

  def attack(enemy)
    raise ArgumentError if !enemy.is_a?(BattleBot)
    raise ArgumentError if enemy == self
    raise ArgumentError if !has_weapon?

    enemy.receive_attack_from(self)
  end  

  def receive_attack_from(bot)
    raise ArgumentError if !bot.is_a?(BattleBot)
    raise ArgumentError if bot == self
    raise ArgumentError if !bot.has_weapon?
    
    take_damage(bot.weapon.damage)
    enemies << bot if !enemies.include?(bot)

    defend_against(bot)
    
    return true
  end 

  def defend_against(enemy)
    attack(enemy) if !dead? && has_weapon? 
  end

  def dead?
    @health <= 0 ? (true) : (false) 
  end


end