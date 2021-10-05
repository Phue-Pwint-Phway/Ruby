class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = Post.where("title LIKE? or description LIKE?",
                        "%#{params[:search]}%",
                        "%#{params[:search]}%")
    

    respond_to do |format|
      format.html
      format.csv { send_data @posts.to_csv, filename: "posts-#{Date.today}.csv" }
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.create_user_id = current_user.id
    @post.updated_user_id = current_user.id

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.updated_user_id = current_user.id

    if @post.update(post_params)
      redirect_to @post
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def upload
  end

  def import
    Post.import(params[:file])
    redirect_to posts_path, notice: "Posts Added Successfully!"
  end

  private
    def post_params
      params.require(:post)
      .permit(:title, :description)
    end

end
