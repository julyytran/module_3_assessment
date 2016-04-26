RSpec.describe "items", :type => :request do
  it "shows a list of items and their attributes " do
    Item.create(name: "Gorgeous Iron Bottle",
    description: "Quo animi vel non ea assumenda. Reprehenderit a perspiciatis numquam. Repellendus quia sit rerum.",
    image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
    Item.create(name: "cool item", description: "cool", image_url: "cool link")
    Item.create(name: "coolest item", description: "cool", image_url: "cool link")

    get '/api/v1/items'

    expect(response.status).to eq 200

    json_body = JSON.parse(response.body)

    expect(json_body.count).to eq 3

    expect(json_body[0]).to eq ({
      "name" => "Gorgeous Iron Bottle",
      "description" => "Quo animi vel non ea assumenda. Reprehenderit a perspiciatis numquam. Repellendus quia sit rerum.",
      "image_url" => "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200"
    })
  end

  it "shows a single item and its info" do
    Item.create(name: "Gorgeous Iron Bottle",
    description: "Quo animi vel non ea assumenda. Reprehenderit a perspiciatis numquam. Repellendus quia sit rerum.",
    image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")

    get '/api/v1/items/1'

    expect(response.status).to eq 200

    json_body = JSON.parse(response.body)

    expect(json_body).to eq ({
      "name" => "Gorgeous Iron Bottle",
      "description" => "Quo animi vel non ea assumenda. Reprehenderit a perspiciatis numquam. Repellendus quia sit rerum.",
      "image_url" => "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200"
    })
  end

  it "deletes an item" do
    Item.create(name: "Gorgeous Iron Bottle",
    description: "Quo animi vel non ea assumenda. Reprehenderit a perspiciatis numquam. Repellendus quia sit rerum.",
    image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")

    expect(Item.count).to eq 1

    delete '/api/v1/items/1'

    expect(response.status).to eq 204
    expect(Item.count).to eq 0
  end

  it "creates an item" do
    item_params = {name: "Gorgeous Iron Bottle",
    description: "Quo animi vel non ea assumenda. Reprehenderit a perspiciatis numquam. Repellendus quia sit rerum.",
    image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200"}

    post '/api/v1/items', item: item_params

    expect(response.status).to eq 201

    json_body = JSON.parse(response.body)

    expect(json_body).to eq ({
      "name" => "Gorgeous Iron Bottle",
      "description" => "Quo animi vel non ea assumenda. Reprehenderit a perspiciatis numquam. Repellendus quia sit rerum.",
      "image_url" => "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200"
    })
  end
end
