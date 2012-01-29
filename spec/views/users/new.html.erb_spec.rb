require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :fbUser => "MyString",
      :current_question_id => 1,
      :isAdmin => false
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_fbUser", :name => "user[fbUser]"
      assert_select "input#user_current_question_id", :name => "user[current_question_id]"
      assert_select "input#user_isAdmin", :name => "user[isAdmin]"
    end
  end
end
