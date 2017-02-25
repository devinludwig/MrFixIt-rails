require 'rails_helper'

RSpec.describe "landing/index.html.erb", type: :feature do
  it "displays the splash page" do
    visit(root_path)
    expect(page).to have_content("Mr. Fix-It is the one-stop-shop to crowd-source all your home repair needs. Need a fence repaired? Cabinets installed? Leaky pipe mended? Post the job on Mr.Fix-It. Then, independent handypeople, carpenters, plumbers, and more are able to view and claim jobs. It's like ride-sharing, but for home repairs!")
  end
end
