require "weapon.rb"
class Weapon

  attr_reader :name, :damage
  attr_accessor :count, :bot, :picked_up
  
  def initialize(name,damage=0)
    raise ArgumentError if !name.is_a?(String)
    raise ArgumentError if !damage.is_a?(Fixnum)
    @name = name
    @damage = damage
    @bot = nil
    @picked_up = false
  end 

  def bot=(bot)
   
   raise ArgumentError if !bot.is_a?(BattleBot) && !bot.nil?
   @bot = bot

  end
 
  def picked_up?
   @picked_up
  end  
end