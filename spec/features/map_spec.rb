feature "home page", js: true do
  let!(:provider) { create(:provider) }

  scenario "with a valid Mississipi code" do
    visit "/"

    within(".map-finder") do
      fill_in "Zipcode", with: "38601"
      find("button").click()
    end

    expect(page).to have_current_path("/")

    expect(page).to have_css(".provider-row")
    expect(page).to have_content provider.name
  end

  scenario "when invalid zipcode is entered an error message is shown" do
    visit "/"

    within(".map-finder") do
      fill_in "Zipcode", with: "31"
      find("button").click()
    end

    expect(page).to have_current_path("/")
    expect(page).to have_content("Please enter a valid Mississippi Zipcode")
  end

  scenario "filter by provider type" do
    p = create(:provider, provider_type: "Parent")

    visit "/"

    within(".map-finder") do
      fill_in "Zipcode", with: "38601"
      select("Parent", from: "Provider Type")
      find("button").click()
    end

    expect(page).to have_current_path("/")
    expect(page).to have_content p.name
  end
end
