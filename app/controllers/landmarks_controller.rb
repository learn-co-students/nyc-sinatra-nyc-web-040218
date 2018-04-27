class LandmarksController < ApplicationController
    get '/landmarks' do
        @landmarks = Landmark.all
        erb :"landmarks/index"
    end
    post '/landmarks' do
        Landmark.create(params[:landmark])
        @landmarks = Landmark.all
        erb :"landmarks/index"
    end

    get '/landmarks/new' do
        erb :"/landmarks/new"
    end

    get '/landmarks/:id' do
        @landmark = Landmark.find(params[:id])
        erb :"landmarks/show"
    end

    post '/landmarks/:id' do
        @landmark = Landmark.find(params[:id])
        @landmark.update(params[:landmark])

        erb :"landmarks/show"
    end

    get '/landmarks/:id/edit' do
        @landmark = Landmark.find(params[:id])
        @figures = Figure.all
        erb :"landmarks/edit"
    end
end
