class StaticPagesController < ApplicationController
    require 'flickr'

    def index
        flickr = Flickr.new

        if params[:profile_id].present?
        response = flickr.people.getPublicPhotos :user_id => params[:profile_id]
        @list = response.as_json
        end
    end
end
