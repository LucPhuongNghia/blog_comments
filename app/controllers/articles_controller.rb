class ArticlesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 4)
    @last3 = Article.last(3)
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
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
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
