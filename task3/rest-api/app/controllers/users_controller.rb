class UsersController < ApplicationController
  def index
    users = User.all

    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update(params[:name])
    if user.save
      render json: user
    else
      render json: "Blin fail"
    end
  end

  def create
    user = User.create(name: params[:name])
    if user.save
      render json: user
    else
      render json: "Blin fail"
    end 
  end

  def destroy 
    user = User.find(params[:id])
    if user.destroy
      render json: "Success"
    else
      render json: "Blin ne udalil"
    end
  end
end