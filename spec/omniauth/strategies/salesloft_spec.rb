require "spec_helper"

describe OmniAuth::Strategies::SalesLoft do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }
  let(:app) {
    lambda do
      [200, {}, ["Hello."]]
    end
  }

  subject do
    OmniAuth::Strategies::SalesLoft.new(app, "appid", "secret", @options || {}).tap do |strategy|
      allow(strategy).to receive(:request) { request }
    end
  end

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  describe "#client_options" do
    it "has the correct site" do
      expect(subject.client.site).to eq("https://accounts.salesloft.com")
    end

    it "has the correct authorize url" do
      expect(subject.client.authorize_url).to eq("https://accounts.salesloft.com/oauth/authorize")
    end
  end

  describe "overrides" do
    it "should allow overrides of the site" do
      @options = {:client_options => {'site' => 'https://example.com'}}
      expect(subject.client.site).to eq('https://example.com')
    end

    it "should allow overrides of the authorize_url" do
      @options = {:client_options => {'authorize_url' => 'https://example.com'}}
      expect(subject.client.options[:authorize_url]).to eq('https://example.com')
    end
  end
end
