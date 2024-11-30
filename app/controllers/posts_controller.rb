class PostsController < ApplicationController
  allow_unauthenticated_access only: [ :index ]
  def index
    @query = params[:q]
    @page = (params[:page] || 1).to_i
    @per_page = 5

    base_query = Post.includes(:replies).order(created_at: :desc)

    if @query.present?
      @posts = base_query.where("posts.body LIKE :query OR posts.author LIKE :query OR replies.body LIKE :query OR replies.author LIKE :query", query: "%#{@query}%")
        .references(:replies)
        .distinct
    else
      @posts = base_query
    end

    @total_count = @posts.count
    @posts = @posts.limit(@per_page).offset((@page - 1) * @per_page)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
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
      params.require(:post).permit(:body).merge(author: Current.user.username)
    end
end
