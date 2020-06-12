class HomesController < ApplicationController
  def top
    @posts = Post.order("RANDOM()").all
  end

  def info
  end

  def privacy
  end
end
