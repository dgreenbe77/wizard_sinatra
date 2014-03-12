class WizardArticle
  attr_reader :params, :title, :article

  def initialize(params)
    @params = params
    @title = csv_grab(0)
    @article = csv_grab(2)
  end

  def csv_grab(number)
    CSV.foreach('input_article.csv', headers: false) do |row|
     if row.include?(params)
       return row[number]
     end
   end
 end


end
