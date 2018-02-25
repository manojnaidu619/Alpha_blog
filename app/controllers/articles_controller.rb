class ArticlesController < ApplicationController
  before_action :perform , except:[:index,:new,:create]

  def index
    @article = Article.all
  end

 def new
   @article = Article.new
 end

 def create
  @article = Article.new(article_params)
   if @article.save
     flash[:notice] = "Article was successfully created"
     redirect_to root_path
   else
     render new_article_path
   end
  end

  def edit
  end

  def update
     if @article.update(article_params)
       flash[:notice] = "Article was successfully Updated!!"
       redirect_to articles_path
     else
       flash[:notice] = "Encountered some error please try again!!"
       render 'new'
     end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Article was successfully deleted"
      redirect_to articles_path
    end
  end

  def show
  end

 private
  def perform
     @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description)
  end

end
