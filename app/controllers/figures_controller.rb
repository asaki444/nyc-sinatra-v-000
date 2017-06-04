require 'pry'
class FiguresController < ApplicationController
  get '/figures' do

  end
  get '/figures/new' do
    erb :'/figures/new'
  end
  post '/figures' do
     @figure = Figure.new(name: params[:figure_name])
     @title = Title.find(params[:figure][:title_ids])
      binding.pry
     @landmark = Landmark.find(params[:figure][:land_mark_ids])
     @figure.landmarks = @landmark if @landmark
     @figure.titles = @title if @title
     @figure.save
     redirect '/figures'
  end
end
