require 'rails_helper'

describe MessagesController, type: :controller do
  let!(:message) { FactoryGirl.build(:message) }
  let!(:message_params) { { text: message.text, group: group, user: subject.current_user } }
  let(:group) { create(:group) }

  describe "when user is log in" do
    login_user

    describe 'GET #index' do

      before do
        get :index, params: { group_id: group }
      end

      it "assigns the requested contact to @group" do
        expect(assigns(:group)).to eq group
      end

      it "populates an array of messages ordered by created_at ASC" do
        messages = create_list(:message, 3, message_params)
        expect(assigns(:messages)).to match(messages.sort{ |a, b| a.created_at <=> b.created_at } )
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end

    describe 'POST #create' do

      it "saves the new message in the database" do
        expect{
            post :create, group_id: group.id, message: attributes_for(:message)
          }.to change(Message, :count).by(1)
      end

      it "redirects to messages#index" do
        post :create,  group_id: group.id, message: attributes_for(:message)
        expect(response).to redirect_to group_messages_path
      end
    end
  end
end
