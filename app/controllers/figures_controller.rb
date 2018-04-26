class FiguresController < ApplicationController
    get '/figures' do
        @figures = Figure.all
        erb :"figures/index"
    end
    get '/figures/:id' do
        @figure = Figure.find(params[:id])
        erb :"figures/show"
    end
    post '/figures/:id' do
        # binding.pry
        @figure = Figure.find(params[:id])
        # @figure.update("name" => params[:name])
        @figure.update(params[:figure])

        erb :"figures/show"
    end
    get '/figures/:id/edit' do
        @figure = Figure.find(params[:id])
        @landmarks = Landmark.all
        erb :"figures/edit"
    end
end