require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  describe "GET #index" do
    before do
      create_list(:entry, 30)
      get :index
    end

    it "populates an array of entries" do
      expect(assigns(:entries)).to match_array(Entry.limit(30))
    end

    it "renders the :index view" do
      expect(response).to render_template(:index)
    end
  end
end
