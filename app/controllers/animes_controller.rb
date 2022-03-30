class AnimesController < ApplicationController

  # GET: /animes
  get "/animes" do
    Anime.all.to_json(include: [studio: {except: [:created_at, :updated_at]}], except: [:created_at, :updated_at])
  end


  # POST: /animes
  post "/animes" do
    #try to find the studio with the info in the params
    # binding.pry #(make sure you know under what key the studio name is)
    studio = Studio.find_by_name(params[:studio])
    if studio 
      @anime = studio.animes.create(title: params[:title], synopsis: params[:synopsis], release_year: params[:release_year], total_seasons: params[:total_seasons], image_url: params[:image_url] )
      if @anime.id
        serialized_anime
      else
        @anime.errors.full_messages.to_sentence
      end
    else
      {error: "The studio doesn't exist"}.to_json
    end
  end

  # GET: /animes/5
  get "/animes/:id" do
    find_anime
    if @anime
      serialized_anime
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
  
  end


  # PATCH: /animes/5
  patch "/animes/:id" do
    find_anime
    if @anime && @anime.update(params)
      serialized_anime
    elsif !@anime
      {errors: "Record not found with id #{params['id']}"}.to_json
    else
      {errors: @anime.errors.full_messages.to_sentence}.to_json
    end
  end

  # DELETE: /animes/5/delete
  delete "/animes/:id" do
    find_anime
    if @anime&.destroy
      {messages: "Record successfully destroyed"}.to_json
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
end

  private

  def find_anime
    @anime = Anime.find_by_id(params["id"])
  end

  def serialized_anime
    @anime.to_json(include: :studio)
  end
end