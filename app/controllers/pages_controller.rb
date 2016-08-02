class PagesController < ApplicationController
  def index
    if current_user
      redirect_to articles_path
    end
    @articles = Article.last(5)
  end

  def about
  end

  def contact
    @contact = Contact.new
  end
end
