class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    #@items = Item.where(:user_id => current_user.id)

    @q = Item.where(:user_id => current_user.id).ransack(params[:q])

    @items = @q.result
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    if params[:item][:image].present?

      uploaded_image = Cloudinary::Uploader.upload(params[:item][:image].path, folder: "closetsnap/items")
      
      @item.image_url = uploaded_image['secure_url']
    end

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #Remove Category

  def remove_category
    item = Item.find(params[:id])
    category = Category.find(params[:category_id])
    item_category = item.itemcategories.find_by(category_id: category.id)
    item_category.destroy if item_category
    redirect_to item_path(item), notice: "Category removed successfully."
  end

  def increment_compliments
    item = Item.find(params[:id])
    item.increment!(:compliments)
    redirect_to item_path(item), notice: "Compliments incremented!"
  end
  
  def decrement_compliments
    item = Item.find(params[:id])
    item.decrement!(:compliments)
    redirect_to item_path(item), notice: "Compliments decremented!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :size, :compliments, :user_id)
    end
end
