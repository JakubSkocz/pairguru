class AddCommentToMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :comment, foreign_key: true
  end
end
