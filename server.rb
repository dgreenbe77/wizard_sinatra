require 'sinatra'
require 'csv'
require 'pry'
get '/' do
  @articles = CSV.readlines('input_article.csv')
  erb :index
end

post '/article' do
  article = params['title_name'],params['url_name'],params['article_name']

  CSV.open('input_article.csv', 'a+') do |file|
    file.puts(article)
  end
  redirect '/'
end


get '/:url_name' do
  @articles = CSV.readlines('input_article.csv')
  @articles.each do |array|
    if array.include?(params[:url_name])
      @current_title = array[0]
      @current_article = array[2]
    end
  end




  erb :article
end
