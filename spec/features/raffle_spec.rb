require "rails_helper"
require_relative Rails.root.join('spec', 'support', 'context', 'test_context.rb')
require_relative Rails.root.join('spec', 'support', 'helpers', 'waiter.rb')

RSpec.feature "Static elements/view", :type => :feature do
  # shared stuff between all feature specs to reduce duplicate code
  include_context 'test_context'

  describe "raffle tests" do
    before(:each) do
      go_to_base_page
    end

    context "user not logged in" do
      scenario "raffle doesn't show" do
        # wait until the page finishes loading before action
        TestHelper::wait_until_present(login_page.warning_notification)

        # binding.pry
        # verify if raffle doesn't show
        expect(page.all('.navbar .navbar-nav li:nth-child(6) a', text: 'Raffle').size).to eq(0)
        expect(page.all('.navbar .navbar-nav li:nth-child(7) a', text: 'Raffle wins').size).to eq(0)
      end
    end

    context "user logged in" do
      scenario "When user can click" do
        # try to login
        # mock_google_login
        # better use VCR but for now just manually log in
        base_page.nav_bar.pages.google_login.click
        binding.pry

        wins = base_page.nav_bar.pages.raffle_wins.text

        # mock_google_user.count = 0
        base_page.nav_bar.pages.raffle.click
        sleep(5)
        expect( page.driver.browser.switch_to.alert.text.blank?).to eql(false)
        msg = page.driver.browser.switch_to.alert.text
        page.driver.browser.switch_to.alert.dismiss
        if msg.eql? "Yay, you win!"
          # binding.pry
          expect(base_page.nav_bar.pages.raffle_wins).to have_text((wins.to_i + 1).to_s)
        else
          expect(base_page.nav_bar.pages.raffle_wins).to have_text(wins)
        end
      end
    end
  end
end