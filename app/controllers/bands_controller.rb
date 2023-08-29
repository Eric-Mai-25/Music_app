class BandsController < ApplicationController
    before_action :set_band, only: [:show, :edit, :update, :destroy]

    def index
        @bands = Band.all
        :index
    end

    def new
        :new
    end

    def show
        @band = Band.find_by(id: params[:id])
        :show
    end

    def create 
        band = Band.new(band_params)
        if band.save!
            redirect_to bands_url
        else
            redirect_to :new
        end

    end

    def edit
        @band = Band.find_by(id: params[:id])
        :edit
    end

    def update
        band = Band.find_by(id: params[:id])
        if band.update(band_params)
            redirect_to bands_url
        else
            redirect_to band_url(band)
        end
    end

    def destroy
        band = Band.find_by(id: params[:id])
        band.destroy
        redirect_to bands_url
    end

    def set_band
        @band = Band.find_by(id: params[:id])
    end
    
    private
    
    def band_params
        params.require(:band).permit(:name)
    end
end
