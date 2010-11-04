class Ability < ActiveRecord::Base
  def to_s;"#{name} (#{abrev.upcase})";end
end
