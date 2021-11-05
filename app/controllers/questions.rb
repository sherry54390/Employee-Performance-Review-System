class QuestionsController < ApplicationController
  def index

  end
  def new
    @questions = Question.new
  end

  def create

  end


end