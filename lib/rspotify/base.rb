module RSpotify

  class Base

    attr_accessor :external_urls, :href, :id, :name, :type, :uri

    def self.find(id)
      #TODO
    end

    def self.search(query, type, limit = 20, offset = 0)
      pluralized_type = "#{type}s"
      type_class = eval type.capitalize

      json = RSpotify.get 'search',
        params: {
          q: query,
          type: type,
          limit: limit,
          offset: offset
        }

      items = json[pluralized_type]['items']
      items.map { |item| type_class.new item }
    end

    def initialize(options = {})
      @external_urls = options['external_urls']
      @href          = options['href']
      @id            = options['id']
      @name          = options['name']
      @type          = options['type']
      @uri           = options['uri']
    end

  end
end