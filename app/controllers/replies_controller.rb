class RepliesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.build(reply_params)

    respond_to do |format|
      if @reply.save
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "replies_#{@post.id}",
            partial: "posts/replies",
            locals: { post: @post }
          )
        }
        format.html { redirect_to posts_path, notice: "Reply was successfully created." }
      else
        format.html { redirect_to posts_path, alert: "Error creating reply." }
      end
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:body, :author)
  end
end
