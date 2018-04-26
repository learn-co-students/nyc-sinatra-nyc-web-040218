class LandmarksController < ApplicationController
    get '/landmarks' do
        @landmarks = Landmark.all
        erb :"/landmarks/index"
    end
    get '/landmarks/:id' do
        @landmark = Landmark.find(params[:id])
        erb :"landmarks/show"
    end
    post '/landmarks/:id' do
        @landmark = Landmark.find(params[:id])
        @landmark.update("name" => params[:name], "year_completed" => params[:year_completed])

        if params[:figure_id].empty? == false
            @landmark.update("figure_id" => params[:figure_id])
        end

        erb :"landmarks/show"
    end
    get '/landmarks/:id/edit' do
        @landmark = Landmark.find(params[:id])
        @figures = Figure.all
        erb :"landmarks/edit"
    end
end
