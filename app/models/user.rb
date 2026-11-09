class User
  attr_accessor :name, :email, :phone, :birth_date, :bio, :points, :max_points

  def initialize(attrs = {})
    @name       = attrs[:name]
    @email      = attrs[:email]
    @phone      = attrs[:phone]
    @birth_date = attrs[:birth_date]
    @bio        = attrs[:bio]
    @points     = attrs[:points] || 7
    @max_points = attrs[:max_points] || 10
  end
  
  def first_name
    @name.split.last
  end

  def self.current_user
    new(
      name: "Felhasználó Neve",
      email: "felhasznalo.email@example.com",
      phone: "+36 30 123 4567",
      birth_date: "1998-05-12",
      bio: "Ez a felhasználó rövid bemutatkozása. Szereti a programozást, a kávét és a hosszú sétákat a természetben.",
      points: 7,
      max_points: 10
    )
  end 

end
