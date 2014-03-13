require_relative 'wizard_article'
require_relative 'load_file'
require_relative 'select_article'
require 'csv'

class SelectArticle

  def initialize(loadFile)
    @file = loadFile
  end

  def select(url)
    @file.each do |wizard|
     if wizard.url.include?(url)
       return wizard
     end
    end
  end

end
