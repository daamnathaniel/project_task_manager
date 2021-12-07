class ProjectsController < ApplicationController
    def index
        @empty_projects = Project.get_by_status("Empty")
        @pending_projects = Project.get_by_status("Pending")
        @completed_projects = Project.get_by_status("Completed")
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.create(project_params(:name, :description))
        @project.status = "Empty"
        @project.save
        redirect_to project_path(@project)
    end

    def show
        @project = Project.find(params[:id])
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params(:name, :description))
        @project.update_status
        redirect_to project_path(@project)
    end

    def destroy
        @project = Project.find(params[:id]).destroy
        redirect_to projects_path
    end

    private
    def project_params(*args)
        params.require(:project).permit(*args)
    end
end
