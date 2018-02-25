class ArticlesController < ApplicationController
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
     render 'new'
   end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
     if @article.update(article_params)
       flash[:notice] = "Article was successfully Updated!!"
       redirect_to articles_path
     else
       flash[:notice] = "Encountered some error please try again!!"
       render 'new'
     end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "Article was successfully deleted"
      redirect_to articles_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end

 private
  def article_params
    params.require(:article).permit(:title,:description)
  end

end
