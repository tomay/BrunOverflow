require 'spec_helper'

describe AnswersController do
  describe "GET answer#new" do
    it "should have a new route" do
      get :new
      expect(assigns(:answer)).to be_a(Answer)
    end
  end

  describe "POST answer#create" do
    let (:new_answer) { FactoryGirl.build(:answer) }

    it "should create a new answer" do
      post :create, answer: { body: new_answer.body, question_id: new_answer.question_id }
      expect(assigns(:answer)).to be_a(Answer)
      expect(assigns(:answer).body).to eq new_answer.body
      expect(assigns(:answer).question_id).to eq new_answer.question_id
    end

    it "should create an answer associated with a question" do
      post :create, answer: { body: new_answer.body, question_id: new_answer.question_id }
      expect(assigns(:answer).question).to be_a(Question)
    end
  end


end