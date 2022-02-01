class LikesController < ApplicationController
    before_action :authenticate_user!, only: %i[create]
  
    def create
      current_user.likes.create(object: object)
      respond_to do |f|
        f.json do
          render json:{ likes_count: object.likes.size}
        end
      end
      # redirect_back(fallback_location: root_path)
    end
  
    private
  
    def object
      object_model.find(params[:object_id])
    end
  
    def object_model
      params[:object_type].humanize.constantize
    end
  end