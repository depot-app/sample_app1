#require 'spec_helper'

#describe "StaticPages" do
#  describe "GET /static_pages" do
#    it "works! (now write some real specs)" do
#      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get static_pages_index_path
#      response.status.should be(200)
#    end
#  end
#end

# spec/requests/static_pages_spec.rb
#require 'spec_helper'
#describe "Static pages" do
#  describe "Home page" do
    #it "should have the content 'Sample App'" do
    #  visit '/static_pages/home'
    #  expect(page).to have_content('Sample App')
#    end
#end

# spec/requests/static_pages_spec.rb
#require 'spec_helper'
#describe "Static pages" do
#  describe "Home page" do
#    describe "Help page" do
      #it "should have the content 'Help'" do
      #  visit '/static_pages/help'
      #  expect(page).to have_content('Help')
#      it "should have the right title" do
#        visit '/static_pages/home'
#        expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
#      end
#    end
#  end
#end

# spec/requests/static_pages_spec.rb
require 'spec_helper'

describe "Static pages" do

subject { page }

describe "Home page" do
  before { visit root_path }
  it { should have_content('Sample App') }
  it { should have_title("Ruby on Rails Tutorial Sample App") }
  it { should_not have_title('| Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end

  describe "Help page" do
    it "should have the h1 'Help'" do
      visit root_path
      expect(page).to have_content('Help')
    end
    it "should have the base title" do
      visit root_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end
    it "should not have a custom page title" do
      visit root_path
      expect(page).not_to have_title('| Help')
    end
  end
  describe "About Us page" do
    it "should have the h1 'About Us'" do
      visit root_path
      expect(page).to have_content('About Us')
    end
    it "should have the base title" do
      visit root_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end
    it "should not have a custom page title" do
      visit root_path
      expect(page).not_to have_title('| About Us')
    end
  end
  describe "Contact page" do
    it "should have the h1 'Contact'" do
      visit root_path
      expect(page).to have_content('Contact')
    end
    it "should have the base title" do
      visit root_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end
    it "should not have a custom page title" do
      visit root_path
      expect(page).not_to have_title('| Contact')
    end
  end
end


