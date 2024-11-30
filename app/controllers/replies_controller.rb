class RepliesController < ApplicationController
  def create
    puts "PLEEEASE"
    @post = Post.find(params[:post_id])
    @reply = @post.replies.build(reply_params)

    if @reply.save
      redirect_to posts_path, notice: "Reply was successfully created."
    else
      redirect_to posts_path, alert: "Error creating reply."
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:body, :author)
  end
end
