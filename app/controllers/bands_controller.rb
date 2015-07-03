class BandsController < ApplicationController

  def index
    @bands = []
    band_hashes = Unirest.get("http://localhost:3000/bands.json").body
    band_hashes.each do |hash|
      @bands << Band.new(hash)
    end
    
  end

  def show
    @band = Band.new(Unirest.get("http://localhost:3000/bands/#{params[:id]}.json").body)
  end

  def create
    @band = Unirest.post("http://localhost:3000/bands.json", 
    headers:{ "Accept" => "application/json" }, 
    parameters:{ name: params[:name], email: params[:email], number_members: params[:number_members] }).body

    redirect_to "/bands/#{@band['id']}"
  end
end
