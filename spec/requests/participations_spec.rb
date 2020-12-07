 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/participations", type: :request do
  # Participation. As you add validations to Participation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Participation.create! valid_attributes
      get participations_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      participation = Participation.create! valid_attributes
      get participation_url(participation)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_participation_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      participation = Participation.create! valid_attributes
      get edit_participation_url(participation)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Participation" do
        expect {
          post participations_url, params: { participation: valid_attributes }
        }.to change(Participation, :count).by(1)
      end

      it "redirects to the created participation" do
        post participations_url, params: { participation: valid_attributes }
        expect(response).to redirect_to(participation_url(Participation.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Participation" do
        expect {
          post participations_url, params: { participation: invalid_attributes }
        }.to change(Participation, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post participations_url, params: { participation: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested participation" do
        participation = Participation.create! valid_attributes
        patch participation_url(participation), params: { participation: new_attributes }
        participation.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the participation" do
        participation = Participation.create! valid_attributes
        patch participation_url(participation), params: { participation: new_attributes }
        participation.reload
        expect(response).to redirect_to(participation_url(participation))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        participation = Participation.create! valid_attributes
        patch participation_url(participation), params: { participation: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested participation" do
      participation = Participation.create! valid_attributes
      expect {
        delete participation_url(participation)
      }.to change(Participation, :count).by(-1)
    end

    it "redirects to the participations list" do
      participation = Participation.create! valid_attributes
      delete participation_url(participation)
      expect(response).to redirect_to(participations_url)
    end
  end
end
