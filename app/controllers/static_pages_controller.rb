class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def contactme
    # Sends email to owner.
    if params[:body].empty?
      flash[:danger]= "Please write your concern."
      render 'contact'
    else
      UserMailer.sendme_mail(params[:body], current_user).deliver_now
      redirect_to root_url
    end
  end
end
