require 'open-uri'

puts "PREP the DB"

Artist.destroy_all
Genre.destroy_all
# TODO: destroy albums that the artist owned

puts "START SEED"


def seed_artists
  api_key = "api_key=key5wiIECTI6NOYbO"
  base_url = "https://api.airtable.com/v0/appOnpFap3mruBMNc/artists?#{api_key}"
  
  offset = ""
  while offset
    url = offset == "" ? base_url : "#{base_url}&offset=#{offset}"
    json = JSON.parse(open(url).read)
    json["records"].each do |data|
      Artist.create!(name: data["fields"]["name"])
    end
    offset = json["offset"]
  end
  puts "DONE CREATING artists"
end

def seed_genres
  api_key = "api_key=key5wiIECTI6NOYbO"
  base_url = "https://api.airtable.com/v0/appOnpFap3mruBMNc/genres?#{api_key}"
  
  offset = ""
  while offset
    url = offset == "" ? base_url : "#{base_url}&offset=#{offset}"
    json = JSON.parse(open(url).read)
    json["records"].each do |data|
      Genre.create!(name: data["fields"]["name"])
    end
    offset = json["offset"]
  end
  puts "DONE CREATING genres"
end

def seed_album
  # TODO
end

seed_artists
seed_genres
seed_albums

