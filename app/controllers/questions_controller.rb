class QuestionsController < ApplicationController
  before_action :set_question , only:[:show,:edit,:update]
  def index
    @all_questions = Question.all
  end
  def new
    @new_question = Question.new
  end

  def create
    @new_question = Question.new(question_params)
    if @new_question.save
      redirect_to root_path ,notice:"Your Question has been successfully added"
    else
      render :new
    end
  end

  def show

  end


  def edit

  end

  def update

    if @question.update(question_params)
      redirect_to root_path, notice:"Your Question has been succesfully updated"
    else
      render :edit
    end

  end
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice: "Question is successfully removed from survey form"
  end

  private

  def question_params
    params.require(:question).permit(:questions)
  end


  def set_question
    @question = Question.find(params[:id])
  end


end