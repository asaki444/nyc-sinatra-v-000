class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params[:landmark_name], year_completed: params[:landmark_year_completed].to_i)
    redirect "/landmarks/#{@landmark.id}"
  end

  post '/landmarks/:id' do
     @landmark = Landmark.find(params[:id])
     @landmark.name = params[:new_landmark]
     @landmark.year_completed = params[:year_completed]
     @landmark.save
     redirect "/landmarks/#{@landmark.id}"
  end
end
