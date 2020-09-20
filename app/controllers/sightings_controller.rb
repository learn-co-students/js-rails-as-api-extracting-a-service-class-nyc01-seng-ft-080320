class SightingsController < ApplicationController
    def index 
        sightings = Sighting.all 
        render json: SightingSerializer.new(sightings).to_serialized_json
    end

    def show 
        sighting = Sighting.find_by(id: params[:id])
        render json: SightingSerializer.new(sighting).to_serialized_json 
    end
end

# it is possible for a single controller#action to render data from multiple models 
# it is possible to specify what we want + dont want to render
#controllers are meant to act as a relay between models + rendered views/json, only

# EXPLANATION - SERVICE CLASS 
# def index
#     sightings = Sighting.all
#     render json: sightings.to_json(:include =>{
#         :bird => {:only => [:name, :species]},
#         :location => {:only => [:latitude, :longitude]}
#     }, :except => [:updated_at])
# end

# def show
#     sighting = Sighting.find_by(id: params[:id])
#     render json: sighting.to_json(:include => {
#         :bird => {:only =>[:name, :species]}, 
#         :location => {:only =>[:latitude, :longitude]}, 
#         }, :except => [:updated_at])
# end
# !EXPLANATION
