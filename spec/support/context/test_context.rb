require_relative Rails.root.join('spec', 'support', 'page_objects', 'base_page.rb')
require_relative Rails.root.join('spec', 'support', 'page_objects', 'home_page.rb')
require_relative Rails.root.join('spec', 'support', 'page_objects', 'juice_page.rb')
require_relative Rails.root.join('spec', 'support', 'page_objects', 'icecream_page.rb')
require_relative Rails.root.join('spec', 'support', 'page_objects', 'login_page.rb')
require_relative Rails.root.join('spec', 'support', 'page_objects', 'sign_up_page.rb')
require_relative Rails.root.join('spec', 'support', 'page_objects', 'cart_page.rb')

RSpec.shared_context 'test_context' do
  let(:base_page)         { BasePage.new }
  let(:home_order_page)   { HomeOrderPage.new }
  let(:juice_page)        { JuicePage.new }
  let(:ice_cream_page)    { IceCreamPage.new }
  let(:login_page)        { LoginPage.new }
  let(:sign_up_page)      { SignUpPage.new }
  let(:cart_page)         { CartPage.new }

  let(:mock_google_user) {
    User.new(id: 2,
             email: "sitescout.test@gmail.com",
             created_at: "2018-02-09 23:00:28",
             updated_at: "2018-02-09 23:04:24",
             provider: "google_oauth2",
             uid: "103630025832884269309",
             name: "SiteScout Test",
             image: nil,
             wins_count: 0)
  }

  def go_to_base_page
    visit base_page.url
  end

  def mock_google_login
    allow(User)
        .to receive(:from_omniauth)
        .and_return(mock_google_user)
  end

  def mock_raffle
    allow(PagesController)
        .to receive(:raffle)
  end
end