class CommentsController < ApplicationController
  before_action :set_product, only: [:create, :destroy]

  def create
    @comment = current_user.comments.create!(comment_params.merge!(product_id: @product.id))
    redirect_to product_path(@product), notice: 'Comment was successfully created.'
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product), notice: 'Comment was successfully deleted.'
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
