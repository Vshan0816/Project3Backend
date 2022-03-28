class AnimesController < ApplicationController

  # GET: /animes
  get "/animes" do
    Anime.all.to_json(include: [studio: {except: [:created_at, :updated_at]}], except: [:created_at, :updated_at])
  end


  # POST: /animes
  post "/animes" do
    @anime = Anime.create(params)
    if @anime.id
      serialized_anime
    else
      @anime.errors.full_messages.to_sentence
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