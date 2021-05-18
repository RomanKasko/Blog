class ArticlesController < ApplicationController
  def index
    @articles = Article.all.paginate(:page => params[:page], :per_page => 4)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def find
    @articles = Article.all
    @articles = @articles.select { |article| article.title.include? params[:q] }
    @articles = Article.where(id: @articles.map(&:id)).order(updated_at: :desc).paginate(:page => params[:page], :per_page => 5)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image, :all_tags, :status)
  end
end