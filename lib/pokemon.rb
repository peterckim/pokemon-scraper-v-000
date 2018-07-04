class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id = nil, name = nil, type = nil, db = nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    id = array[0]
    name = array[1]
    type = array[2]
    
    pokemon = Pokemon.new(id, name, type)
  end
end
