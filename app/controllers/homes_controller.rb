class HomesController < ApplicationController
  def top 
    @random = Post.where(status: 1).order("RANDOM()")
  end

  def info
  end

  def privacy
  end
end
