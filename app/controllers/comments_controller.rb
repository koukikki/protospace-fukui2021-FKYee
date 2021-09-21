class CommentsController < ApplicationController

def create
  comment = Comment.create(comment_params)
  @comment = Comment.where(prototype_id: comment.prototype_id)
  score = @comment.average(:score)
  
  proto = Prototype.find(comment.prototype_id)
  proto.update(assessment_ave: score)
  redirect_to prototype_path(comment.prototype_id)
end

private

def comment_params
  params.require(:comment).permit(:score, :text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
end

end
