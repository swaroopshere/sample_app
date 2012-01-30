class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    #query user table 
    # if(user exists)
    #     return current question id
    # else
    #    create new user on the user table
    #    return question 1
    # end if 
    @question = Question.find(params[:id])
    #@question = Question.find_by_text(params[:id])
    
    @options = Option.find_all_by_question_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @question }
      #format.json {render :json => @options }
    end
  end
  
  def landingShow
    @firstQuestion = Question.first(:order => 'sequencenumber asc')
    @question = @firstQuestion
    if @firstQuestion.nil?
      #redirect_to "/pages/home"
      return
    else
      
    end

    @user = User.find_by_fbUser(params[:email])
    if @user.nil?
      @user=User.new() #TODO - add appropriate parameters
      @user.fbUser=params[:email]
      @user.current_question_id = @firstQuestion.id
      @user.isAdmin = "false"
      @user.save
    else
      @question = Question.find(@user.current_question_id)
    end
     respond_to do |format|
       format.html { redirect_to @question, :notice => 'Question for you' }
       format.json { render :json => @question, :status => :next, :location => @question  }
     end
  end


  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])
    respond_to do |format|
      if @question.save
        format.html {  redirect_to @question, :notice => 'Question was successfully created.'} #redirect_to :action => "index"
        format.json { render :json => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, :notice => 'Question was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :ok }
    end
  end
end
