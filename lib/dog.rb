class Dog 
  attr_accessor :name, :breed, :id 
  
  def initialize(hash)
    @name = hash[:name]
    @breed = hash[:breed]
  end 
  
  def self.create_table 
    sql = <<-SQL 
            CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        breed TEXT
        )
    SQL
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table
        sql = <<-SQL 
    DROP TAble dogs 
    SQL
    DB[:conn].execute(sql)
  end 
  
  def save
    sql = <<-SQL 
      INSERT INTO dogs (name, breed) VALUES (?,?)
    SQL
    
    DB[:conn].execute(sql, self.name, self.breed)
  end 
  
end 