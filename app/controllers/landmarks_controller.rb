class LandmarksController < ApplicationController

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    erb :"landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  post '/landmarks' do
    new_landmark = Landmark.create(params[:landmark])
    if params[:landmark].uniq
      new_landmark = Landmark.create(params[:landmark])
      new_figure.landmarks << new_landmark
    end
    redirect to ("/landmarks/#{new_landmark.id}")
  end

  get '/landmarks/:id/edit' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    erb :"landmarks/show"
  end

end
