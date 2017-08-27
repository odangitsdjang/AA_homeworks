require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        post :create, params: { user: { email: "david@david.com", password: "" } }
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        post :create, params: { user: { email: "david@david.com", password: "lengt" } }
        expect(response).to render_template(:new)
        # expect(page).to have_content '6 characters'
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects user to bands index on success" do
        post :create, params: { user: { email:"david@david.com", password:"password"}}
        expect(response).to redirect_to(bands_url)
        expect(flash[:errors]).to_not be_present

      end
    end
  end
end
