class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name:params["name"])
    params["title_ids"].each do |title|
      FigureTitle.create(title_id:title.to_i, figure_id:@figure.id)
    end
    params["landmark_ids"].each do |landmark|
      Landmark.update(landmark, figure_id: @figure.id)
    end
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

end