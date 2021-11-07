require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /home" do
    it "responds normal" do
      get home_path
      expect(response).to have_http_status(200)
    end
  end
end