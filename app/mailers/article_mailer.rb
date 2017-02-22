class ArticleMailer < ApplicationMailer
  def new_article(article)
    @article = article

    user.all.each do |user|
      mail(to: user.email, subject:"nuevo articulo en blogfacilito")
    end
  end
end
