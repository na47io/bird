class PostsController < ApplicationController
  def index
    @posts = Post.includes(:replies).order(created_at: :desc).all
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream { 
          render turbo_stream: turbo_stream.prepend("posts", partial: "posts/post", locals: { post: @post })
        }
        format.html { redirect_to posts_path, notice: "Post was successfully created." }
      else
        format.html { redirect_to posts_path, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def post_params
      params.require(:post).permit(:body, :author)
    end
end
