require 'rails_helper'

RSpec.describe ApplicationsController, type: :controller do
  before do
    @user = FactoryGirl.create(:user)
    @user.confirm
    sign_in @user
    @my_app = FactoryGirl.create(:application, user_id: @user.id)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns my_app to applications" do
      get :index
      expect(assigns(:app)).to eq([@my_app])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: @my_app.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: @my_app.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, {id: @my_app.id}
      expect(assigns(:app)).to eq(@my_app)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @app" do
      get :new
      expect(assigns(:app)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Post by 1" do
      expect{post :create, application: {name: Faker::Lorem.word, url: Faker::Internet.url}}.to change(Application,:count).by(1)
    end

    it "assigns the new application to @app" do
      post :create, application: {name: Faker::Lorem.word, url: Faker::Internet.url}
      expect(assigns(:app)).to eq Application.last
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: @my_app.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: @my_app.id}
      expect(response).to render_template :edit
    end

    it "assigns app to be updated to @app" do
      get :edit, {id: @my_app.id}
      app_instance = assigns(:app)
      expect(app_instance.id).to eq @my_app.id
      expect(app_instance.name).to eq @my_app.name
      expect(app_instance.url).to eq @my_app.url
    end
  end

  describe "PUT update" do
    it "updates app with expected attributes" do
      new_name = Faker::Lorem.word
      new_url = Faker::Internet.url
      put :update, id: @my_app.id, application: {name: new_name, url: new_url}

      updated_app = assigns(:app)
      expect(updated_app.id).to eq @my_app.id
      expect(updated_app.name).to eq new_name
      expect(updated_app.url).to eq new_url
    end

    it "redirects to the updated post" do
      new_name = Faker::Lorem.word
      new_url = Faker::Internet.url
      put :update, id: @my_app.id, application: {name: new_name, url: new_url}
      expect(response).to redirect_to @my_app
    end
  end

  describe "DELETE destroy" do
    it "deletes the app" do
      delete :destroy, {id: @my_app.id}
      count = Application.where({id: @my_app.id}).size
      expect(count).to eq 0
    end

    it "redirects to apps index" do
      delete :destroy, {id: @my_app.id}
      expect(response).to redirect_to applications_path
    end
  end
end
