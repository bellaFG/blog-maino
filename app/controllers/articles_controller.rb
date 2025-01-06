class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]


  def index
    @articles = Article.all
  end


  def show
    @article = Article.friendly.find(params[:id])
    @comments = @article.comments
    @comment = @article.comments.build
  end


  def new
    @article = Article.new
  end


  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: "Artigo criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @article = current_user.articles.find_by(id: params[:id])


    if @article.nil?
      flash[:alert] = "Você não tem permissão para editar este artigo."
      redirect_to articles_path
    end
  end

  def update
    @article = current_user.articles.find_by(id: params[:id])


    if @article.update(article_params)
      redirect_to @article, notice: "Artigo atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @article = current_user.articles.find_by(id: params[:id])

    if @article.nil?
      flash[:alert] = "Você não tem permissão para excluir este artigo."
      redirect_to articles_path
    else
      @article.destroy
      redirect_to articles_path, notice: "Artigo excluído com sucesso."
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
