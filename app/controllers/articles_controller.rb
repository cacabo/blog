class ArticlesController < ApplicationController
    before_action :authenticate_admin!, except: [:index, :show]
    before_action :correct_admin,   only: [:edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def index
        @articles = Article.all
    end

    def new
        @article = current_admin.articles.build
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = current_admin.articles.build(article_params)

        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end


    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit(:title, :text, :image)
    end
    # Confirms the correct admin.
    def correct_admin
        @article = Article.find(params[:id])
        @admin = Admin.find(current_admin.id)
        redirect_to(root_url) unless current_admin.id == @article.admin.id
    end
end
