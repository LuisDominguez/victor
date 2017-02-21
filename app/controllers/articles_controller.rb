class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index]
  before_action :set_article, except: [:index,:new,:create]

  #get /articles
  def index

  # todos los registros
    @articles =  Article.paginate(page: params[:page],per_page:10).ultimos
  end

  #get /articles/:id
  def show
    @article.update_visits_count
    @comment = Comment.new
  end

  #get /articles/new
  def new
    @article = Article.new
    @categories = Category.all
  end

  def edit

  end

  #post /articles
  def create
      @article = current_user.articles.new(article_params)
      @article.categories = params[:categories]
      if @article.save
        redirect_to @article
      else
        render :new
      end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy  #destroy eliminar el objeto de la bd
    redirect_to articles_path
  end

  #put /articles/: id
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def publish
    @article.publish!
    redirect_to @article
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
      params.require(:article).permit(:title,:body,:cover,:categories)
  end
end
