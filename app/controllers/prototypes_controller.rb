class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :destroy]

  def index
    @prototypes = Prototype.includes(:user)
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
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def destroy
    redirect_root
    @prototype.destroy
    redirect_to root_path
  end

  def edit
    redirect_root
  end

  def update
    redirect_root
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

  def redirect_root
    redirect_to root_path unless current_user.id == @prototype.user_id
  end
end
