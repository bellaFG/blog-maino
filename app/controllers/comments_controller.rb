class CommentsController < ApplicationController
  def create
    @article = Article.find_by!(slug: params[:article_id])
    @comment = @article.comments.build(comment_params)

    if current_user
      @comment.user = current_user
    end

    if @comment.save
      redirect_to @article, notice: "O seu comentário foi enviado."
    else
      redirect_to @article, alert: "Não foi possível enviar o comentário."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
