class ArticlesController < ApplicationController
  layout "application"

  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :set_article, only: [ :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def index
    @articles = Article.all
      Rails.logger.debug "Carregando artigos: #{@articles.inspect}"
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to articles_path, notice: "Artigo criado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: "Artigo atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Artigo excluído com sucesso!"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def authorize_user!
    unless @article.user == current_user
      redirect_to articles_path, alert: "Você não tem permissão para editar ou excluir este artigo."
    end
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
