class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :delete_picture]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    authorize @articles
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    authorize @article
  end

  # GET /articles/new
  def new
    @article = Article.new
    authorize @article
  end

  # GET /articles/1/edit
  def edit
  end

  def set_images
    @article1 = Article.find(10)
    gon.splited_article = @article1
    # @array_of_image_blocks = Array.new
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # def set_article_images
  #
  # end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json

def delete_picture
  @pictures = @article['pictures']
  @integer_index = params[:index]
  @deleted_pictures = @pictures.delete_at(@integer_index.to_i())
  # logger.info @deleted_pictures
  @pictures = @deleted_pictures
  @article.save
  redirect_to request.referrer
end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    authorize @article
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :user_id, pictures: [])
    end
end
