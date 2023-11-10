class OutfitsController < ApplicationController
  before_action :set_outfit, only: %i[ show edit update destroy ]

  # GET /outfits or /outfits.json
  def index
    @outfits = Outfit.where(:user_id => current_user.id)
  end

  # GET /outfits/1 or /outfits/1.json
  def show
  end

  # GET /outfits/new
  def new
    @outfit = Outfit.new
  end

  # GET /outfits/1/edit
  def edit
  end

  # POST /outfits or /outfits.json
  def create
    @outfit = Outfit.new(outfit_params)

    if params[:outfit][:image].present?
      uploaded_image = Cloudinary::Uploader.upload(params[:outfit][:image].path, folder: "closetsnap/outfits")
      @outfit.image_url = uploaded_image['secure_url']
    end

    respond_to do |format|
      if @outfit.save
        format.html { redirect_to outfit_url(@outfit), notice: "Outfit was successfully created." }
        format.json { render :show, status: :created, location: @outfit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @outfit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outfits/1 or /outfits/1.json
  def update

    if params[:outfit][:image].present?
      uploaded_image = Cloudinary::Uploader.upload(params[:outfit][:image].path, folder: "closetsnap/outfits")
      @outfit.image_url = uploaded_image['secure_url']
    end
    respond_to do |format|
      if @outfit.update(outfit_params)
        format.html { redirect_to outfit_url(@outfit), notice: "Outfit was successfully updated." }
        format.json { render :show, status: :ok, location: @outfit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @outfit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outfits/1 or /outfits/1.json
  def destroy
    @outfit.destroy

    respond_to do |format|
      format.html { redirect_to outfits_url, notice: "Outfit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outfit
      @outfit = Outfit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def outfit_params
      params.require(:outfit).permit(:compliments, :user_id, item_ids: [])
    end
end
