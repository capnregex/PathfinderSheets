
class AbilityScore
  POINTS = [nil,nil,nil,nil,nil,nil,nil,-4,-2,-1,0,1,2,3,5,7,10,13,17]
  class ModelName < String
    def plural
      self.pluralize
    end
    def singular
      self.singularize
    end
  end
  class << self
    def all *args
      (1..25).collect {|id| new(id)}
    end
    def find id, *args
      new(id)
    end
    def model_name
      ModelName.new('ability_score')
    end
  end
  def initialize id
    @id = id.to_i
  end
  attr_reader :id
  def name;id.to_s;end
  def to_s;id.to_s;end
  def points
    POINTS[id]
  end
  def modifier
    (( id - 10 ) * 0.5 ).floor
  end
  def bonus_spells 
    @bonus_spells ||= 10.times.collect do |l| 
      if id >= 10
        if l > 0
          v = ( id - 2 - l * 2 ) / 8 
          if v > 0
            v
          else
            0
          end
        else
          0
        end
      else
        nil
      end
    end
  end
end
