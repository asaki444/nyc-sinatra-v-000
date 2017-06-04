require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id/edit' do
     @figure = Figure.find(params[:id])
     erb :'/figures/edit'
  end

  post '/figures' do

     @figure = Figure.create(name: params[:figure_name])

     if !params["new_title"].empty?
       title = Title.create(name: params["new_title"])
       @figure.figure_titles << FigureTitle.create(figure_id: @figure.id, title_id: title.id )
     end

     if !params["new_landmark"].empty?
       @figure.landmarks << Landmark.create(name: params["new_landmark"])
     end

      if !params["figure"]["landmark_ids"].nil?
         @landmark = Landmark.find(params["figure"]["landmark_ids"])
         @figure.landmarks << @landmark
      end

     if !params["figure"]["title_ids"].nil?
        @figure.titles << Title.find(params["figure"]["title_ids"])
     end

     @figure.save
     redirect "/figures/#{@figure.id}"
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
     if !params[:figure_name].empty?
       @figure.name = params[:figure_name]
     end

     if !params[:new_landmark].empty?
       @figure.landmarks << Landmark.create(name: params[:new_landmark])
     end

     if !params["new_title"].empty?
       title = Title.create(name: params["new_title"])
       @figure.figure_titles << FigureTitle.create(figure_id: @figure.id, title_id: title.id )
     end

     if !params["figure"]["landmark_ids"].nil?
        @landmark = Landmark.find(params["figure"]["landmark_ids"])
        @figure.landmarks << @landmark
     end
     @figure.save
     
     redirect "/figures/#{@figure.id}"
  end


  get '/figures/:id' do
    @this_figure = Figure.find(params[:id])
    erb :"/figures/show"
  end


end
