class CommentsController < ApplicationController
    before_action :set_article

    def create
      @comment = @article.comments.build(comment_params)

      if @comment.save
        respond_to do |format|
            format.html { redirect_to root_path }
            format.js
        end
      else
        flash[:alert] = "Oops! Something went wrong."
        render root_path
      end
    end

    def destroy
      @comment = @article.comments.find(params[:id])

      @comment.destroy
      @comment.delete
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:name, :content)
    end

    def set_article
      @article = Article.find(params[:article_id])
    end
end
