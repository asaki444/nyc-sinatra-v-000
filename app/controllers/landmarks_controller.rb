class LandmarksController < ApplicationController
  get '/landmarks' do
    erb :'/landmarks/index'
  end
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end
  post '/landmarks' do
    Landmark.new(name: params[:landmark_name], year_completed: params[:year_completed].to_i)
    redirect '/landmarks'
  end
end
