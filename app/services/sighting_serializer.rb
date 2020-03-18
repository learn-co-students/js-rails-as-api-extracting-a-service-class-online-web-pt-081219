class SightingSerializer
    def initialize(sighting_object)
        @sighting = sighting_object
    end

    def to_serialized_json
        object = {
            :include => {
                :bird => {:only => [:id, :name, :species]},
                :location => {:only => [:id, :latitude, :longitude]}
            }, 
            :except => [:updated_at, :created_at, :bird_id, :location_id]
        }
        @sighting.to_json(object)
    end
end