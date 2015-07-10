class Band

attr_accessor :name, :email, :number_members, :id

  def initialize(band)
    @name = band["name"]
    @email = band['email']
    @number_members = band['number_members']
    @id = band['id']

  end

  def self.find(id)
    Band.new(Unirest.get("#{ENV["API_BASE_URL"]}/bands/#{id}.json", headers:{ "Accept" => "application/json", "X-User-Email" => "test@test.com", "Authorization" => "Token token=password"}).body)
  end

  def self.all
    bands = []

    band_hashes = Unirest.get("#{ENV["API_BASE_URL"]}/bands.json", headers:{ "Accept" => "application/json", "X-User-Email" => "#{ENV['API_EMAIL']}", "Authorization" => "Token token=#{ENV['API_KEY']}"}).body

    band_hashes.each do |hash|
      bands << Band.new(hash)
    end

    bands

  end

  def destroy
  Unirest.delete("#{ENV["API_BASE_URL"]}/bands/#{id}.json", 
    headers:{ "Accept" => "application/json" }).body

    
  end

end