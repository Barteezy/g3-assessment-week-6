require "spec_helper"
require "park_parse"

describe "Park Parser" do
  it "index_by_id" do
    park_list = [
        {
            :id => 546,
            :name => "Kalahari Resorts",
            :city => "Wisconsin Dells",
            :state => "Wisconsin",
            :country => "United States"
        },
        {
            :id => 547,
            :name => "Little Amerricka",
            :city => "Marshall",
            :state => "Wisconsin",
            :country => "United States"
        }
    ]

    parks = ParkParse.new(park_list)

    expected = {
        546 => {
            :id => 546,
            :name => "Kalahari Resorts",
            :city => "Wisconsin Dells",
            :state => "Wisconsin",
            :country => "United States"
        },
        547 => {
            :id => 547,
            :name => "Little Amerricka",
            :city => "Marshall",
            :state => "Wisconsin",
            :country => "United States"
        }
    }

    actual = parks.index_by_id
    expect(actual).to eq(expected)
  end

  it "index_by_country" do
    park_list = [
        {
            :id=>546,
            :name=>"Kalahari Resorts",
            :city=>"Wisconsin Dells",
            :state=>"Wisconsin",
            :country=>"United States"
        },
        {
            :id=>547,
            :name=>"Little Amerricka",
            :city=>"Marshall",
            :state=>"Wisconsin",
            :country=>"United States"
        },
        {
            :id=>2,
            :name=>"Calaway Park",
            :city=>"Calgary",
            :state=>"Alberta",
            :country=>"Canada"
        }
    ]
  parks = ParkParse.new(park_list)

    expected = {
        "Canada" => [
            {
                :id=>2,
                :name=>"Calaway Park",
                :city=>"Calgary",
                :state=>"Alberta",
                :country=>"Canada"
            }
        ],
        "United States" => [
            {
                :id=>546,
                :name=>"Kalahari Resorts",
                :city=>"Wisconsin Dells",
                :state=>"Wisconsin",
                :country=>"United States"
            },
            {
                :id=>547,
                :name=>"Little Amerricka",
                :city=>"Marshall",
                :state=>"Wisconsin",
                :country=>"United States"
            }
        ]
    }

    actual = parks.index_by_country
    expect(actual).to eq(expected)
  end

end