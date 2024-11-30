class RepliesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.build(reply_params)

    if @reply.save
      respond_to do |format|
        format.html { redirect_to posts_path, notice: "Reply was successfully created." }
        format.turbo_stream { head :ok }
      end
    else
      redirect_to posts_path, alert: "Error creating reply."
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:body).merge(author: Current.user.username)
  end
end
