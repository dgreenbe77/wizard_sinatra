require_relative 'wizard_article'
require_relative 'load_file'
require_relative 'select_article'
require 'csv'

class WizardArticle
  attr_reader :title, :content, :url

  def initialize(params)
    @title = params['title']
    @url = params['url']
    @content = params['content']
  end

  def self.select_specific_article(url, file_name)
    SelectArticle.new(LoadFile.file_load(file_name)).select(url)
  end

  def csv_write(file_name)
    if !FileTest.exists?(file_name)
      CSV.open(file_name, 'a+', write_headers: true, headers: ["title","content","url"]) do |file|
        file.puts([title[@title], content[@content], url[@url]])
      end
    else
      CSV.open(file_name, 'a+') do |file|
        file.puts([title[@title], content[@content], url[@url]])
      end
    end
  end

  # def initialize(params)
  #   @params = params
  #   @title = csv_grab(0)
  #   @article = csv_grab(2)
  # end

  # def self.create(params)
  #   title = params[:title]
  #   content = params[:content]

  #   WizardArticle.new(title, content)
  # end

  # def self.find(title)
  #   CSV.foreach('input_article.csv', headers: false) do |row|
  #     if row[:title] == title
  #       article = WizardArticle.new()
  #     end
  #   end
  # end
end
