feature "Site can be localized to Vietnamese and Spanish" do
  let(:en_string) { "Locate day care providers near you" }
  let(:es_string) { "Localizar proveedores de cuidado infantil de su zona:" }
  let(:vn_string) { "Xác định vị trí nhà cung cấp chăm sóc ban ngày gần bạn" }

  before do
    visit root_path
    expect(page).to have_content(en_string)
    expect(page).to have_no_content(es_string)
    expect(page).to have_no_content(vn_string)

    expect(page).to have_no_link("English")
    expect(page).to have_link("Español")
    expect(page).to have_link("Tiếng Việt")

  end

  scenario "Translate to Spanish" do
    click_link "Español"

    expect(page).to have_no_content(en_string)
    expect(page).to have_content(es_string)
    expect(page).to have_no_content(vn_string)

    expect(page).to have_link("English")
    expect(page).to have_no_link("Español")
    expect(page).to have_link("Tiếng Việt")
  end

  scenario "Translate to Vietnamese" do
    click_link "Tiếng Việt"

    expect(page).to have_no_content(en_string)
    expect(page).to have_no_content(es_string)
    expect(page).to have_content(vn_string)

    expect(page).to have_link("English")
    expect(page).to have_link("Español")
    expect(page).to have_no_link("Tiếng Việt")
  end
end
