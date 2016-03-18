class AssignmentsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :set_groups, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_assignment, only: [:show, :edit, :update, :destroy, :check_timeout]
  before_action :check_timeout, only: [:edit, :update]

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = current_user.assignments.paginate(:page => params[:page], :per_page => 10)    
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    if check_timeout?(@assignment) && !@assignment.check?
      create_download_repos @assignment
    end
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit

  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = current_user.assignments.build assignment_params
    if @assignment.due_date <= Time.now.to_date 
      flash['danger'] = 'Due was unable.'
      redirect_to  new_assignment_path
    else 
      respond_to do |format|
        if @assignment.save
          format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
          format.json { render :show, status: :created, location: @assignment }
        else
          format.html { render :new }
          format.json { render json: @assignment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    @ass = current_user.assignments.build assignment_params
    if @ass.due_date <= Time.now.to_date 
      flash['danger'] = 'Due was unable.'
      redirect_to  edit_assignment_path(@assignment)
    else
      respond_to do |format|
        if @assignment.update(assignment_params)
          format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
          format.json { render :show, status: :ok, location: @assignment }
        else
          format.html { render :edit }
          format.json { render json: @assignment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  # Find all groups
  def set_groups
    @groups = Group.all
  end

  # Can't change assignment if timeout
  def check_timeout
    redirect_to @assignment if @assignment.due_date < Time.now.to_date 
  end
  
  # Check current_use is assignment's user 
  def correct_user
    if Assignment.exists?(params[:id])
      @user = Assignment.find(params[:id]).user
      unless current_user?(@user)
        flash['danger'] = "Permission denied"
        redirect_to(assignments_path)
      end
    else
      flash['danger'] = "Assignment not found"
      redirect_to (assignments_path)
    end
  end

  # Create link download repos
  def create_download_repos assignment
    assignment.update_attributes :check => true
    assignment.group.members.each do |member|
      link = "https://bitbucket/#{member.name}/#{assignment.repo_name}.zip"
      assignment.member_assignments.create(member_id: member.id, link: link)
    end
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def assignment_params
    params.require(:assignment).permit :name, :repo_name, :group_id, :due_date
  end
end
