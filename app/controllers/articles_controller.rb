class ArticlesController < ApplicationController
  before_action :perform , except:[:index,:new,:create]

  def index
    @article = Article.paginate(:page => params[:page], :per_page => 3)
  end

 def new
   @article = Article.new
 end

 def create
  @article = Article.new(article_params)
  @article.user_id = User.last.id
   if @article.save
     flash.now[:notice] = "Article was successfully created"
     redirect_to root_path
   else
     render new_article_path
   end
  end

  def edit
  end

  def update
     if @article.update(article_params)
       flash.now[:notice] = "Article was successfully Updated!!"
       redirect_to @article.user
     else
       flash.now[:notice] = "Encountered some error please try again!!"
       render 'new'
     end
  end

  def destroy
    if @article.destroy
      flash.now[:notice] = "Article was successfully deleted"
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
