RSpec.describe "items", :type => :request do
  it "shows a list of items and their attributes " do
    Item.create(name: "Gorgeous Iron Bottle",
    description: "Quo animi vel non ea assumenda. Reprehenderit a perspiciatis numquam. Repellendus quia sit rerum.",
    image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")

    get '/api/v1/items'

    expect(response.status).to eq 200

    json_body = JSON.parse(response.body)

    expect(json_body[0]).to eq ({
      "name" => "Gorgeous Iron Bottle",
      "description" => "Quo animi vel non ea assumenda. Reprehenderit a perspiciatis numquam. Repellendus quia sit rerum.",
      "image_url" => "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200"
    })
  end
end

# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has a name, description, and image_url but not the created_at or updated_at
