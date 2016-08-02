class CommentsController < ApplicationController
   before_action :authenticate_user!
   
   def create
       @article = Article.find(params[:article_id])
       @comment = @article.comments.create(params_comment)
       @comment.user_id = current_user.id if current_user
       
       if @comment.save
           redirect_to article_path(@article), notice: "Added a comment"
       else
           render :new
       end
   end
   
   def update
       @article = Article.find(params[:article_id])
       @comment = @article.comments.find(params[:id])
       
       if @comment.update(params_comment)
           redirect_to article_path(@article), notice: "Comment was created"
       else
           redirect_to :edit
       end
   end
   
   def edit
       @article = Article.find(params[:article_id])
       @comment = @article.comments.find(params[:id])
   end
   
   def destroy
       @article = Article.find(params[:article_id])
       @comment = @article.comments.find(params[:id])
       @comment.destroy
       redirect_to article_path(@article), notice: "Article has been deleted"
   end
   
   private
    def params_comment
       params.require(:comment).permit(:body) 
    end
end