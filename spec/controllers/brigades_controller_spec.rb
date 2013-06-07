# encoding: utf-8
require 'spec_helper'

describe BrigadesController do
  render_views

  before(:all) do
    @brigade_1 = FactoryGirl.create(:brigade)
    @brigade_2 = FactoryGirl.create(:brigade, workers: 1, cost: 20)
    @brigade_3 = FactoryGirl.create(:brigade, workers: 10, cost: 450)
    @brigade_4 = FactoryGirl.create(:brigade, workers: 0, cost: 0)
    @brigade_5 = FactoryGirl.create(:brigade, workers: 2, cost: 200)
  end

  describe 'GET #index' do
    it 'should content info about all brigades' do
      get :index
      expect(response).to render_template :index
      expect(response.body).to match /Listing brigades/
      expect(response.body).to include(@brigade_1.name)
      expect(response.body).to include(@brigade_1.workers.to_s)
      expect(response.body).to include(@brigade_1.cost.to_s)
      expect(response.body).to include(@brigade_2.name)
      expect(response.body).to include(@brigade_2.workers.to_s)
      expect(response.body).to include(@brigade_2.cost.to_s)
    end
  end

  describe 'GET #show' do
    it 'should content all info about brigade' do
      get :show, id: @brigade_1.id
      expect(response).to render_template :show
      expect(response.body).to match /Name:/
      expect(response.body).to match /Workers:/
      expect(response.body).to match /Cost:/
      expect(response.body).to include(@brigade_1.name)
      expect(response.body).to include(@brigade_1.workers.to_s)
      expect(response.body).to include(@brigade_1.cost.to_s)
    end
  end

  describe 'GET #new' do
    it 'should be successful' do
      get :new
      expect(response).to render_template :new
      expect(response.body).to match /New brigade/
    end
  end

  describe 'GET #edit' do
    it 'should be successful' do
      get :edit, id: @brigade_1.id
      expect(response).to render_template :edit
      expect(response.body).to match /Editing brigade/
    end
  end

  describe 'POST #create' do
    describe 'with valid params' do
      it 'creates a new Brigade' do
        expect {
          post :create, brigade: FactoryGirl.attributes_for(:brigade)
        }.to change(Brigade, :count).by(1)
      end

      it 'redirects to the created brigade' do
        post :create, brigade: FactoryGirl.attributes_for(:brigade)
        response.should redirect_to(Brigade.last)
        flash[:notice].should match /Brigade was successfully created./
      end
    end

    describe 'with invalid params' do
      it "re-renders the 'new' template" do
        Brigade.any_instance.stub(:save).and_return(false)
        post :create, brigade: FactoryGirl.attributes_for(:brigade, name: '')
        response.should render_template :new
      end
    end
  end

  describe 'PUT #update' do
    describe 'with valid params' do
      it 'updates the requested brigade' do
        Brigade.any_instance.should_receive(:update_attributes).with("name" => "MyString")
        put :update, {id: @brigade_3.id, brigade: { "name" => "MyString" }}
      end

      it 'redirects to the brigade' do
        expect(
          put :update, id: @brigade_3.id,
          brigade: FactoryGirl.attributes_for(:brigade, name: 'New brigade')
        ).to redirect_to brigade_url(assigns(:brigade))
      end
    end

    describe 'with invalid params' do
      it "re-renders the 'edit' template" do
        Brigade.any_instance.stub(:save).and_return(false)
        put :update, id: @brigade_3.id, brigade: { name: "" }
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested brigade' do
      expect {
        delete :destroy, id: @brigade_4.id
      }.to change(Brigade, :count).by(-1)
    end

    it 'redirects to the brigades list' do
      delete :destroy, id: @brigade_5.id
      expect(response).to redirect_to brigades_url
    end
  end
end
