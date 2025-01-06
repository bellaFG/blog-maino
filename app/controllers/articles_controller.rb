class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]

  def index
    @articles = Article.order(created_at: :desc)
  end

  def search
    @articles = Article.search(params[:q])
  end

  def show
    @article = Article.friendly.find(params[:slug])
    @comments = @article.comments.order(created_at: :desc)
    @comment = @article.comments.build
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Artigo criado com sucesso." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity, alert: @article.errors.full_messages.to_sentence }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @article = current_user.articles.friendly.find(params[:slug])
    if @article.nil?
      flash[:alert] = "Você não tem permissão para editar este artigo."
      redirect_to articles_path
    end
  end

  def update
    @article = current_user.articles.friendly.find(params[:slug])
    if @article.update(article_params)
      redirect_to @article, notice: "Artigo atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_url, notice: "O artigo foi removido com sucesso."
    else
      redirect_to articles_url, alert: "Erro ao tentar excluir o artigo."
    end
  end

  private

  def set_article
    @article = Article.friendly.find(params[:slug])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author)  # Certifique-se de que todos os parâmetros necessários estão permitidos
  end

  def search_params
    params.permit(:q)
  end
end
