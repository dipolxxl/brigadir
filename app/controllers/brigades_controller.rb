class BrigadesController < ApplicationController
  before_filter :brigade_finder, only: [:show, :edit, :update, :destroy]

  def index
    @brigades = Brigade.order(:created_at)
    tag_cloud
  end

  def show
  end

  def new
    @brigade = Brigade.new
  end

  def edit
  end

  def create
    @brigade = Brigade.new(params[:brigade])

    if @brigade.save
      redirect_to @brigade, notice: 'Brigade was successfully created.'
    else
      render :new
    end
  end

  def update
    if @brigade.update_attributes(params[:brigade])
      redirect_to @brigade, notice: 'Brigade was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @brigade.destroy
    redirect_to brigades_url
  end

  def tag_cloud
    @tags = Brigade.tag_counts_on(:tags)
  end

  private

  def brigade_finder
    @brigade = Brigade.where(id: params[:id]).first
  end
end
