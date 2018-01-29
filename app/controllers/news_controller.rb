class NewsController < ApplicationController
  require 'rss'
  require 'open-uri'

  def index
    # @eltiempo = get_rss('http://www.eltiempo.com/rss/opinion.xml')
    # @caracol = get_rss('http://www.caracol.com.co/feed.aspx?id=196')
    @google = get_rss('https://news.google.com/news/rss/headlines/section/q/Corrupci%C3%B3n%20en%20Colombia/Corrupci%C3%B3n%20en%20Colombia?ned=es_co&hl=es-419&gl=CO')
    @google2 = get_rss('https://news.google.com/news/rss/search/section/q/Desfalco%20en%20Colombia/Desfalco%20en%20Colombia?hl=es-419&gl=CO&ned=es_co')
    @google3 = get_rss('https://news.google.com/news/rss/search/section/q/Desvio%20de%20recursos%20en%20Colombia/Desvio%20de%20recursos%20en%20Colombia?hl=es-419&gl=CO&ned=es_co')
    @claim = "El anterior no es un valor real, solo es un valor representativo basado en datos estadisticos y de investigación"
    @money = Persistence.find_by(name: 'money')
  end

  def lost_money
    @money = Persistence.find_by(name: 'money')
    respond_to do |format|
      format.js
    end
  end

  private
  def get_rss (url)
    rss_results = []
    rss = RSS::Parser.parse(open(url).read, false).items[0..-1]
    
    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: result.description }
      rss_results.push(result)
    end
    return rss_results
  end
end
