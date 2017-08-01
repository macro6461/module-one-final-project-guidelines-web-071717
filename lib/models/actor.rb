class Actor < ActiveRecord::Base
  has_many :characters
  has_many :movies, through: :characters

  # def characters
  #   Character.all.find{|character| self.character_id == character.id}.full_name
  # end
end
