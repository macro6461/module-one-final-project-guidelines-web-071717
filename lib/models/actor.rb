class Actor < ActiveRecord::Base
  has_many :characters
  has_many :movies, through: :characters

  def full_name
    "#{first_name} #{last_name}"
  end

  # def characters
  #   Character.all.find{|character| self.character_id == character.id}.full_name
  # end
end
