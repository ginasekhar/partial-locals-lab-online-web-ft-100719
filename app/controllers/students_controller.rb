require 'pry'
class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    #binding.pry
    if params[:query] && !params[:query].empty?
      @students = Student.search(params[:query])
    else
      @students = Student.all
    end
    #binding.pry
    render 'index'
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown, :query)
  end
end
