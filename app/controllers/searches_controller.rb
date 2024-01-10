class SearchesController < ApplicationController
  protect_from_forgery except: :create

  def index
  end

  def create
    query = params[:query].downcase.strip
    ip_address = request.remote_ip

    if query.present?
      existing_searches = Search.where("lower(query) LIKE ?", "#{query}%").to_a

      if existing_searches.present?
        # check for the longest search query
        longest_query = existing_searches.max_by { |search| search.query.length }

        if query.length > longest_query.query.length
          existing_searches.each { |search| search.destroy unless search == longest_query }

          Search.create(query: query, ip_address: ip_address)
        end
      else
        Search.create(query: query, ip_address: ip_address)
      end
    end

    results = Search.where("lower(query) LIKE ?", "%#{query}%")
    render json: { status: 'success', results: results }
  end

  def all_searches
    # here a cache would be approriate to store most queried for scalability
    all_searches = Search.all
    unique_searches = get_unique_searches(all_searches)
    render json: { searches: unique_searches }
  end

  private

  def get_unique_searches(searches)
    unique_searches = []

    searches.each do |search|
      normalized_query = search.query.gsub(/\s+/, '')

      existing_search = unique_searches.find do |unique|
         # Remove spaces to ensure comparison between similar searches though not well spaced
        normalized_existing_query = unique[:query].gsub(/\s+/, '')
        normalized_query.start_with?(normalized_existing_query)
      end

      if existing_search.nil?
        unique_searches.push({ query: search.query, ip_address: search.ip_address })
      elsif search.query.length > existing_search[:query].length
        existing_search[:query] = search.query
      end
    end
    unique_searches
  end
end
