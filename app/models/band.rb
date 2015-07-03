class Band

attr_accessor :name, :email, :number_members

  def initialize(band)
    @name = band["name"]
    @email = band['email']
    @number_members = band['number_members']

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

end