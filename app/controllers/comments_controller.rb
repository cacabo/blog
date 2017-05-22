class CommentsController < ApplicationController
    before_action :set_article

    def create
      @comment = @article.comments.build(comment_params)

      if @comment.save
        flash[:success] = "Comment successful!"
        redirect_to @comment.article
      else
        flash[:alert] = "Oops! Something went wrong."
        render root_path
      end
    end

    def destroy
      @comment = @article.comments.find(params[:id])

      @comment.destroy
      flash[:success] = "Comment deleted"
      redirect_to @article
    end

    private

    def comment_params
      params.require(:comment).permit(:name, :content)
    end

    def set_article
      @article = Article.find(params[:article_id])
    end
end
