class CommentsController < ApplicationController
  def create
    respond_to do |format|
      format.js do
        @comment = Comment.new(comment_params)
        if @comment.save
          @comments = Comment.last_some.where(comment_goal_type: params[:comment][:comment_goal_type],
                                              comment_goal_id: params[:comment][:comment_goal_id])
          flash[:notice] = 'Comment was successfully created.'
          render :index, format: :js
        else
          flash[:error] = render_to_string(partial: 'shared/active_record_errors',
                                           locals: { object: @comment })
          render partial: 'shared/show_flash'
        end
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author, :content, :comment_goal_id, :comment_goal_type)
    end
end
