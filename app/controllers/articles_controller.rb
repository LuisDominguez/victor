class ArticlesController < ApplicationController

  #get /articles
  def index

  # todos los registros
    @articles =  Article.all
  end

  #get /articles/:id
  def show
    @article = Article.find(params[:id])
  end

  #get /articles/new
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  #post /articles
  def create
    @article = Article.new(article_params)


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
    # update
    # @article.update_attributes({title: 'nuevo titulo'})
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit 
    end
  end

  private

  def article_params
      params.require(:article).permit(:title,:body)
  end

end
