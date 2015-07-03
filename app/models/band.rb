class Band

attr_accessor :name, :email, :number_members

  def initialize(band)
    @name = band["name"]
    @email = band['email']
    @number_members = band['number_members']

  end


end