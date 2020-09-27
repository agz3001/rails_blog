class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only:[:show, :edit, :update, :destroy]
  before_action :validate_user, only:[:show, :edit, :update, :destroy]

  def index
    @article =current_user.articles.order(created_at: :desc).page(params[:page]).per(6).search(params[:search])
    # 検索機能のsearch(params[:search])はページネーションの後ろにつけてok
  end

  def show
    @article =Article.find(params[:id])
  end

  def new
    @article =Article.new
  end

  def edit
  end

  def create
    @article =Article.new(article_params)
    @article.user_id =current_user.id
    if @article.save
      redirect_to @article, notice:"作成できました"
    else
      render :new, alert:"作成できませんでした"
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice:"更新しました"
    else
      render :edit, alert:"更新できませんでした"
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path, notice:"破棄しました"
    else
      redirect_to root_path, alert:"破棄できませんでした"
    end
  end


  private

  def find_article
    @article =Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :image)
  end

  def validate_user
    if @article.user !=current_user
      redirect_to root_path, alert:"他所の覗き見はできません"
    end
  end


end
