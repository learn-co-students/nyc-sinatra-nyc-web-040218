require 'pry'
class FiguresController < ApplicationController

    get '/figures' do
      @figures = Figure.all
      erb :"figures/index"
    end

    get '/figures/new' do
      @figures = Figure.all
      @titles = Title.all
      @landmarks = Landmark.all
      erb :"figures/new"
    end

    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :"figures/show"
    end

    post '/figures' do
      new_figure = Figure.create(params[:figure])
      if params[:title][:name].length > 0
        new_title = Title.create(params[:title])
        new_figure.titles << new_title
      end
      if params[:landmark][:name].length > 0
        new_landmark = Landmark.create(params[:landmark])
        new_figure.landmarks << new_landmark
      end
      redirect to "/figures/#{@figure.id}"
    end

    get '/figures/:id/edit' do
      @figures = Figure.all
      @titles = Title.all
      @landmarks = Landmark.all
      @figure = Figure.find(params[:id])
      erb :"figures/edit"
    end

    patch '/figures/:id' do
      @figure = Figure.find(params[:id])
      @figure.update(params[:figure])
      @landmark = Landmark.find(params[:figure][:landmark_ids])
      @title = Title.find(params[:figure][:title_ids])
      erb :"figures/show"
    end


end
