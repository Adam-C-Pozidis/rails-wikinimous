class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @new_article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(params_article)
    redirect_to article_path(article)
  end
  def create
    Article.create(params_article)
    redirect_to articles_path
  end
  def destroy
    article = Article.find(params[:id])
    article.delete
    redirect_to articles_path
  end

 private

  def params_article
    params["article"].permit(:title, :content)
  end
end
