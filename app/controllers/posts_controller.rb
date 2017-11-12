class PostsController < ApplicationController
  def new
  	# 空のモデルをビューへ渡す
  	@post = Post.new
  end

  def create
  	# ストロングパラメータを使用
  	@post = Post.new(post_params)
  	# DBへ保存する
  	@post.save
  	# 新規投稿画面へリダイレクト
  	redirect_to post_path(@post.id)
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  private

  def post_params
  	params.require(:post).permit(:title, :body, :category)
  end

end
