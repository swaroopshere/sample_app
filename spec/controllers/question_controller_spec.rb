require 'spec_helper'

describe QuestionController do

  describe "GET 'text:string'" do
    it "should be successful" do
      get 'text:string'
      response.should be_success
    end
  end

  describe "GET 'sequenceNumber:longint'" do
    it "should be successful" do
      get 'sequenceNumber:longint'
      response.should be_success
    end
  end

end
