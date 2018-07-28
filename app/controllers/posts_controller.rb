class PostsController < ApplicationController
  before_action :set_category, only: [:index, :new, :edit, :create, :update]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.where(category_id: params[:category_id]).order(updated_at: :desc).limit(20)
    #for category comments form
    @comment = @category.comments.new
  end

  def show
    #for post comments form
    @comment = @post.comments.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.filename = params[:post][:file]

    if @post.save
      redirect_to category_post_path(@category, @post), notice: 'Post was successfully created.'
    else
      flash[:error] = render_to_string partial: 'shared/active_record_errors', locals: {object: @post}
      render :new
    end
  end

  def update
    @post.filename = params[:post][:file] if params[:post][:file]
    if @post.update(post_params)
      redirect_to category_post_path(@category, @post), notice: 'Post was successfully updated.'
    else
      flash[:error] = render_to_string partial: 'shared/active_record_errors', locals: {object: @post}
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to category_posts_path(params[:category_id]), notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :content, :filename, :category_id, :filename_cache)
    end
end
