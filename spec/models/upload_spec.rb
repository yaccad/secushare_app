require 'spec_helper'

describe Upload do

  let(:user) { FactoryGirl.create(:user) }
  before { @upload = user.uploads.build(name: "Filename", content: "Lorem ipsum") }

  subject { @upload }

  it { should respond_to(:name) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  
  it { should be_valid }

  describe "when user_id is not present" do
    before { @upload.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @upload.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @upload.name = "a" * 41 }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @upload.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @upload.content = "a" * 141 }
    it { should_not be_valid }
  end
end