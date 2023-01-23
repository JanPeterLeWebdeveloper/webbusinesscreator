class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show explore]
  skip_after_action :verify_authorized, only: [:user_index]
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = policy_scope(Project)
    if params[:project_tag].present?
      @projects = Project.where(project_tag: params[:project_tag])
    elsif params[:query].present?
      @projects = Project.search_project_name_description(params[:query])
    else
      @projects = Project.where.not(user: current_user)
    end
    respond_to do |format|
      format.html
      format.text { render json: { projects: @projects } }
    end
  end

  def user_index
    @projects = policy_scope(Project).where(user: current_user)
    @project = Project.new
    authorize @project
    @test = Test.new
  end

  def show
    @project = Project.find(params[:id])
    authorize @project
    @test = Test.new
    authorize @test
    @tests = Test.order(time_limit: :asc)
    find_chatrooms
  end

  def new
    @project = Project.new
    authorize @project
  end

  def edit
    @project = Project.find(params[:id])
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    authorize @project
    if @project.save
      redirect_to my_projects_path
    else
      render :new
    end
  end

  # def my_projects
  #   @projects = policy_scope(current_user.projects)
  #   # authorize @projects
  # end

  def update
    @project = Project.find(params[:id])
    authorize @project
    if @project.update(project_params)
      redirect_to my_projects_path
    else
      render :show
    end
  end

  def destroy
    authorize @project
    redirect_to my_projects_path if @project.destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def find_chatrooms
    @find_existing_chatroom = Chatroom.where(
      'receiver_id = ? AND sender_id = ?',
      Project.find(params[:id]).user,
      current_user
    ).first
    if @find_existing_chatroom.nil?
      @chatroom = Chatroom.new
    else
      @chatroom = @find_existing_chatroom
    end
  end

  def project_params
    params.require(:project).permit(:name, :description, :github_url, :project_tag)
  end
end
