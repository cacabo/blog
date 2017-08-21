class ArticlesController < ApplicationController
    before_action :authenticate_admin!, except: [:index, :show]
    before_action :correct_admin,   only: [:edit, :update, :destroy]

    def index
        if (params[:tag])
            @articles = Article.tagged_with(params[:tag])
        else
            @articles = Article.all
        end
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
      @article = Article.find(params[:id]) if Article.exists? params[:id]
      @previous = nil
      @next = nil

      if @article
        id = @article.id.to_i - 1
        while (not @previous) and (id >= Article.first.id)
          @previous = Article.exists?(id) ? Article.find(id) : nil
          id = id - 1
        end
        id = @article.id.to_i + 1
        while (not @next) and (id <= Article.last.id)
          @next = Article.exists?(id) ? Article.find(id) : nil
          id = id + 1
        end
        if (not @next or not @previous)
          random = Article.limit(10).where.not(id: id).order("RANDOM()")
          @next = @next.nil? ? random.first : @next
          @previous = @previous.nil? ? random.second : @previous
        end
      else
        random = Article.limit(10).order("RANDOM()")
        @previous = random.first
        @next = random.second
      end
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
        params.require(:article).permit(:title, :text, :image, :tag_list)
    end
    # Confirms the correct admin.
    def correct_admin
        @article = Article.find(params[:id])
        @admin = Admin.find(current_admin.id)
        redirect_to(root_url) unless current_admin.id == @article.admin.id
    end
end
