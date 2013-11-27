class Game < ActiveRecord::Base
  has_many :rounds
  has_many :citizens

  def reaping
    (1..12).to_a.each do |district|
      d = District.find_by(number: district)
      bob = Citizen.where("(age > 11 AND age < 19) AND district_id = #{d.id} AND sex = 'M'").sample
      sally = Citizen.where("(age > 11 AND age < 19) AND district_id = #{d.id} AND sex = 'F'").sample
      bob.type = "Tribute"
      bob.rating = (1..10).to_a.sample
      bob.save
      sally.type = "Tribute"
      sally.rating = (1..10).to_a.sample
      sally.save
      self.citizens.push(bob, sally)
    end
  end
end
