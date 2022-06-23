require 'rails_helper'

RSpec.describe "health/index.html.slim", type: :view do
  it 'shows the right content' do
    visit health_index_path
    expect(page).to have_content('Health connection')
  end
end
