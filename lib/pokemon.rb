class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  
  def initialize(id = nil, name = nil, type = nil, hp = nil, db = nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?, ?)", name, type, hp)
  end
  
  def self.find(id, db)
    array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    id = array[0]
    name = array[1]
    type = array[2]
    
    pokemon = Pokemon.new(id, name, type)
  end
end
