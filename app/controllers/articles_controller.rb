class ArticlesController < ApplicationController

  #get /articles
  def index
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

  #post /articles
  def create
    @article = Article.new(title: params[:article][:title],body: params[:article][:body])

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  #put /articles/: id
  def update

  end
end
