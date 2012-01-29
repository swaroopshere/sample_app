require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :fbUser => "MyString",
      :current_question_id => 1,
      :isAdmin => false
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_fbUser", :name => "user[fbUser]"
      assert_select "input#user_current_question_id", :name => "user[current_question_id]"
      assert_select "input#user_isAdmin", :name => "user[isAdmin]"
    end
  end
end
