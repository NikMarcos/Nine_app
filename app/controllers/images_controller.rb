class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  wrap_parameters format: [:json, :xml, :url_encoded_form, :multipart_form]
  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to request.referrer, notice: 'Image was successfully created.' }
      else
        format.html { redirect_to request.referrer, notice: 'Image did not save.' }
      end
    end
  end

  def get_images
    # @image = Image.new(image_params)
    @art_id = image_article_params[:article_id]
    @pic = image_article_params[:pic]
    # respond_to do |format|
    #   if @pic.save
    #     format.html { redirect_to request.referrer, notice: 'Image was successfully created.' }
    #   else
    #     format.html { redirect_to request.referrer, notice: 'Image did not save.' }
    #   end
    # end
    @pic.each do |key,value|
      logger.debug "Id of article: #{@art_id}"
      Rails.logger.warn "Params for image #{key}: #{value.original_filename}"
    end

      # logger.debug "Parameters for image2: #{@pic[:"0"].original_filename}"


    redirect_to articles_url
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Image has successfully deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    def image_article_params
      params.require(:image_article).permit(:article_id, :pic=>{})
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:title, :pic, :user_id)
    end

    # def image_article_params
    #   params.require(:image_article).permit(:pic=>[], :article_id=>[])
    # end


end
