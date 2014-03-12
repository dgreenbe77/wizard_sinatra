require 'sinatra'
require 'csv'
require 'pry'
require_relative 'lib/class_article'

get '/' do
  @links = CSV.readlines('input_article.csv')
  erb :index
end

post '/article' do
  article = params['title_name'],params['url_name'],params['article_name']
  @articles = WizardArticle.new(article)
  @articles.csv_write('input_article.csv')

  redirect '/'
end


get '/:url_name' do
  @articles = WizardArticle.new(params[:url_name])
  @links = CSV.readlines('input_article.csv')

  erb :article
end
