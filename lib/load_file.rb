require_relative 'wizard_article'
require_relative 'load_file'
require_relative 'select_article'
require 'csv'

class LoadFile

  def self.file_load(file_name)
    articles = []
    CSV.foreach(file_name, headers: true) do |row|
      articles << WizardArticle.new(row.to_hash)
    end
    articles
  end

  # def self.enumerate_articles(articles)
  #   articles.each {|article| article}
  # end


end
