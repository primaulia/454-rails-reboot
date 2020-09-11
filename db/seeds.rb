require 'open-uri'

puts "PREP the DB"

Artist.destroy_all
Genre.destroy_all
# TODO: destroy albums that the artist owned

puts "START SEED"

BASE_URL = "https://api.airtable.com/v0/appOnpFap3mruBMNc"
API_KEY = "api_key=key5wiIECTI6NOYbO"


def seed_artists  
  endpoint = "#{BASE_URL}/artists?#{API_KEY}"
  
  offset = ""
  while offset
    url = offset == "" ? endpoint : "#{endpoint}&offset=#{offset}"
    json = JSON.parse(open(url).read)
    json["records"].each do |data|
      Artist.create!(name: data["fields"]["name"])
    end
    offset = json["offset"]
  end
  puts "DONE CREATING artists"
end

def seed_genres  
  endpoint = "#{BASE_URL}/genres?#{API_KEY}"
  
  offset = ""
  while offset
    url = offset == "" ? endpoint : "#{endpoint}&offset=#{offset}"
    json = JSON.parse(open(url).read)
    json["records"].each do |data|
      Genre.create!(name: data["fields"]["name"])
    end
    offset = json["offset"]
  end
  puts "DONE CREATING genres"
end

def seed_album
  # TODO. seed album from the api
end

seed_artists
seed_genres
seed_albums

