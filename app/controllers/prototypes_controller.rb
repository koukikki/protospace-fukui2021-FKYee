class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    redirect_to root_path unless current_user.id == @prototype.user_id
  end

  def update
    @prototype.update(prototype_params)
    if @prototype.save
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
