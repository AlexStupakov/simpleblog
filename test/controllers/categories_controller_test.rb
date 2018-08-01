require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  describe CategoriesController, type: :controller do
    let!(:category) { FactoryGirl.create(:category) }

    it "should get index" do
      get :index

      expect(response).to have_http_status(:success)
      expect(assigns(:categories)).to eq [category]
    end

    it "should get new" do
      get :new

      expect(response).to have_http_status(:success)
      expect(assigns(:category)).not_to be_nil
    end

    describe "#create" do
      subject { post :create, category: FactoryGirl.attributes_for(:category) }

      it { expect{ subject }.to change { Category.count }.by(1) }
      it { expect(subject).to redirect_to category_posts_path(assigns(:category)) }
    end


    it "should get edit" do
      get :edit, id: category

      expect(response).to have_http_status(:success)
      expect(assigns(:category)).to eq category
    end

    describe "#update" do
      subject { patch :update, id: category, category: FactoryGirl.attributes_for(:category) }

      it { expect(subject).to redirect_to category_posts_path(category) }
      it { expect(subject.request.flash[:notice]).to_not be_nil }
    end

    describe "#destroy" do
      subject { delete :destroy, id: category }

      it { expect{ subject }.to change { Category.count }.by(-1) }
      it { expect(subject.request.flash[:notice]).to_not be_nil }
      it { expect(subject).to redirect_to categories_path }
    end
  end
end

