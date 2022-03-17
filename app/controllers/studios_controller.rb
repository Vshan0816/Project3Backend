class StudiosController < ApplicationController

  # GET: /studios
  get "/studios" do
    erb :"/studios/index.html"
  end

  # GET: /studios/new
  get "/studios/new" do
    erb :"/studios/new.html"
  end

  # POST: /studios
  post "/studios" do
    redirect "/studios"
  end

  # GET: /studios/5
  get "/studios/:id" do
    erb :"/studios/show.html"
  end

  # GET: /studios/5/edit
  get "/studios/:id/edit" do
    erb :"/studios/edit.html"
  end

  # PATCH: /studios/5
  patch "/studios/:id" do
    redirect "/studios/:id"
  end

  # DELETE: /studios/5/delete
  delete "/studios/:id/delete" do
    redirect "/studios"
  end
end
