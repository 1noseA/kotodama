class HomesController < ApplicationController
  def top
    @posts = Post.order("RANDOM()").limit(5)
  end

  def info
  end

  def privacy
  end
end
