class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_movie, only: [:create, :destroy]

  def index
    @comments = Comment.top_commenters
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)    
    @comment.movie_id = @movie.id
    if @comment.save
      redirect_to movie_path(@movie), notice: 'Comment added successfully'
    else
      redirect_back(fallback_location: root_path, alert: "Something was wrong")
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path, notice: 'Your comment was destroyed')      
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])    
  end

  def comment_params
    params.require(:comment).permit(:id, :description, :rating, :movie_id)
  end

end
