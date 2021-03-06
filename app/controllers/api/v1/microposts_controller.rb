module Api
  module V1

    class MicropostsController < ApplicationController
    
      def index
        @microposts = Micropost.all
      end


      def create
        @micropost = Micropost.create(micropost_params)
      end
    
      def destroy
        @micropost = Micropost.find(params[:id])
        if @micropost.destroy
          head :no_content, status: :ok
        else
          render json: @micropost.errors, status: :unprocessable_entity
        end
    
      end
    
      private
    
      def micropost_params
        params.permit(:content, :user_id, :exhibition_id)
      end
    end

  end
end

