class BrigadesController < ApplicationController
  before_filter :brigade_finder, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @brigades = Brigade.order(sort_column + ' ' + sort_direction)
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

  def sort_column
    Brigade.column_names.include?(params[:sort]) ? params[:sort] : 'cost'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
