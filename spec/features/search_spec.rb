RSpec.describe "user can search by keyword" do
  it "returns results for search term 'sennheiser'" do
    visit root_path

    fill_in :q, :with => "sennheiser"
    click_on "Search"

    expect(current_path).to eq "/search"

    # And I should see exactly 15 results
    # And each result should contain sku, name, customer average review, short description, sale price, and image ONLY
  end
end
