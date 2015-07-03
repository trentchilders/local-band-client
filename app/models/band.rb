class Band

attr_accessor :name, :email, :number_members, :id

  def initialize(band)
    @name = band["name"]
    @email = band['email']
    @number_members = band['number_members']
    @id = band['id']

  end

  def self.find(id)
    Band.new(Unirest.get("http://localhost:3000/bands/#{id}.json").body)
  end

  def self.all
    bands = []
    band_hashes = Unirest.get("http://localhost:3000/bands.json").body

    band_hashes.each do |hash|
      bands << Band.new(hash)
    end

    bands

  end

  def destroy
  Unirest.delete("http://localhost:3000/bands/#{id}.json", 
    headers:{ "Accept" => "application/json" }).body

    
  end

end