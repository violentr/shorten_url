RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

   describe "POST #shorten_url" do
    let(:url) { "www.google.co.uk" }

    before do
      post :shorten_url, params: {url: url}
      @output = JSON.parse(response.body)
    end

    it "returns JSON object as output" do
      expect(@output).to be_a(Hash)
    end

    it "returns object with keys" do
      expect(@output.keys).to eq(%w(id short_url original_url))
    end

    it "should have data for original and short_url" do
      expect(@output["original_url"]).to eq(url)
      expect(@output["short_url"]).not_to be_blank
      expect(@output["short_url"]).to be_a(String)
    end
   end
end
