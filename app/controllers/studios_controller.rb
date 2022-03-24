class StudiosController < ApplicationController

  # GET: /studios
  get "/studios" do
    Studio.all.to_json(include: [animes: {except: [:created_at, :updated_at]}], except: [:created_at, :updated_at])
  end

  # POST: /studios
  post "/studios" do
    @studio = Studio.create(params)
    if @studio.id
      serialized_studio
    else
      @studio.errors.full_messages.to_sentence
    end
  end

  # GET: /studios/5
  get "/studios/:id" do
    find_studio
    if @studio
      serialized_studio
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
  end


  # PATCH: /studios/5
  patch "/studios/:id" do
    find_studio
    if @studio && @studio.update(params)
      serialized_studio
    elsif !@studio
      {errors: "Record not found with id #{params['id']}"}.to_json
    else
      {errors: @studio.errors.full_messages.to_sentence}.to_json
    end
  end

  # DELETE: /studios/5/delete
  delete "/studios/:id/delete" do
    find_studio
    if @studio&.destroy
      {messages: "Record successfully destroyed"}.to_json
    else
      {errors: "Record not found with id #{params['id']}"}.to_json
    end
  end


private

  def find_studio
    @studio = Studio.find_by_id(params["id"])
  end

  def serialized_studio
    @studio.to_json(include: :animes)
  end
end