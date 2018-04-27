class FiguresController < ApplicationController
    get '/figures' do
        @figures = Figure.all
        erb :"figures/index"
    end

    post '/figures' do
    #   binding.pry
      new_figure = Figure.create(params[:figure])

      if params[:title][:name]
        new_t = Title.create(params[:title])
        FigureTitle.create("figure_id" => new_figure.id, "title_id" => new_t.id)
      end

      if params[:landmark][:name]
        new_land = Landmark.create(params[:landmark])
        new_land.update("figure_id" => new_figure.id)
      end
      
      @figures = Figure.all
      erb :"figures/index"
    end

    get '/figures/new' do
      @landmarks = Landmark.all
      @titles = Title.all
      erb :"figures/new"
    end
    
    get '/figures/:id' do
        @figure = Figure.find(params[:id])
        erb :"figures/show"
    end

    post '/figures/:id' do
        @figure = Figure.find(params[:id])
        @figure.update(params[:figure])

        if params[:title][:name]
          new_t = Title.create(params[:title])
          FigureTitle.create("figure_id" => new_figure.id, "title_id" => new_t.id)
        end

        if params[:landmark][:name]
          Landmark.create(params[:landmark])
        end

        erb :"figures/show"
    end
    get '/figures/:id/edit' do
        @figure = Figure.find(params[:id])
        @titles = Title.all
        @landmarks = Landmark.all
        erb :"figures/edit"
    end
end
