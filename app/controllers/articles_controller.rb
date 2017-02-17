class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index]
  before_action :set_article, except: [:index,:new,:create]
  #get /articles
  def index

  # todos los registros
    @articles =  Article.all
  end

  #get /articles/:id
  def show
    @comment = Comment.new
    @article = Article.find(params[:id])
    @article.update_visits_count
  end



  #get /articles/new
  def new
    @article = Article.new
  end

  def edit

  end

  #post /articles
  def create
      @article = current_user.articles.new(article_params)
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

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
      params.require(:article).permit(:title,:body,:cover)
  end
end
