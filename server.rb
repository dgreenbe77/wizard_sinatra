require 'sinatra'
require 'csv'
require 'pry'
require_relative 'lib/wizard_article'
require_relative 'lib/load_file'
require_relative 'lib/select_article'

get '/' do
  @articles = LoadFile.file_load('input_article.csv')
  erb :index
end

post '/article' do
  # WizardArticle.create(params)
  @article = WizardArticle.new(params)
  @article.csv_write('input_article.csv')

  redirect '/'
end


get '/:url' do
  @article = WizardArticle.select_specific_article(params[:url], 'input_article.csv')
  @articles = LoadFile.file_load('input_article.csv')

  erb :article
end
