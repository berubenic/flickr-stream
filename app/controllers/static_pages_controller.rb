class StaticPagesController < ApplicationController
    require 'flickr'

    def index
        flickr = Flickr.new

        if params[:profile_id].present?
            begin
                response = flickr.people.getPublicPhotos :user_id => params[:profile_id]    
            rescue => error
                flash.now[:errors] = error.msg        
            end
            @list = response.as_json
        end
    end
end
