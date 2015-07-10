class BandsController < ApplicationController

  def index
    @bands = Band.all

    # @bands = []
    # band_hashes = Unirest.get("http://localhost:3000/bands.json").body
    # band_hashes.each do |hash|
    #   @bands << Band.new(hash)
    # end

  end

  def show
    @band = Band.find(params[:id])
   
  end

  def create
    @band = Unirest.post("#{ENV["API_BASE_URL"]}/v1/bands.json", 
    headers:{ "Accept" => "application/json" }, 
    parameters:{ name: params[:name], email: params[:email], number_members: params[:number_members] }).body

    redirect_to "/bands/#{@band['id']}"
  end

  def destroy

    @band = Band.find(params[:id])
    @band.destroy

    redirect_to '/bands'
  end
end
