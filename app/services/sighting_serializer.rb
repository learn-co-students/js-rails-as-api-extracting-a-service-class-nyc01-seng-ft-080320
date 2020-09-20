class SightingSerializer
    belongs_to :bird
    belongs_to :location

    def initialize(sighting_object)
        @sighting = sighting_object
    end

    def to_serialized_json
        optionsHash = {:include => {
            :bird => {:only => [:name, :species]}, 
            :location => {:only => [:latitude, :longitude]}
        }, :except => [:updated_at]}
        @sighting.to_json(optionsHash)
    end

end