require 'spec_helper'

describe "Upload pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "upload creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create an upload" do
        expect { click_button "Upload" }.not_to change(Upload, :count)
      end

      describe "error messages" do
        before { click_button "Upload" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'upload_name', with: "Lorem" }
      before { fill_in 'upload_content', with: "Lorem ipsum" }
      it "should create an upload" do
        expect { click_button "Upload" }.to change(Upload, :count).by(1)
      end
    end
  end
  describe "upload destruction" do
    before { FactoryGirl.create(:upload, user: user) }

    describe "as correct user" do
      before { visit user_path(user) }

      it "should delete an upload" do
        expect { click_link "delete" }.to change(Upload, :count).by(-1)
      end
    end
  end
end