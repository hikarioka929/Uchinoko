class PetsController < ApplicationController

    before_action :authenticate_user!

    def new
        @pet = Pet.new
    end

    def index
    end

    def create
        @pet = Pet.new(pet_params)
        @pet.sex = params[:sex].to_i
        @pet.user_id = current_user.id
        if @pet.save
            redirect_to pet_path(@pet.id)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    
    def pet_params
        params.require(:pet).permit(:genre_id,:name,:introduction,:sex,:age,:image)
    end
end
