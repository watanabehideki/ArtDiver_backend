module Api
  module V1
    class ExhibitionsController < ApplicationController
    
      def index
        @exhibitions = Exhibition.includes(:gallery)
    
        render json: @exhibitions.as_json(include: :gallery) 
      end
    
      def show
        @exhibition = Exhibition.includes(:gallery).find(params[:id]) 
      end
    
    end
  end
end
