class ParkParse

  def initialize(park_list)
    @parks = park_list
  end

  def index_by_id
    park_hash = {}
    @parks.each do |park|
      park_hash[park[:id]] = park
    end
    park_hash
  end

  def index_by_country
    park_hash = {}
    @parks.each do |park|
      park_hash[park[:country]] ||= []
      park_hash[park[:country]] << park
    end
    park_hash
  end

end