class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index,:show]

    def new
    end

    def index
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
