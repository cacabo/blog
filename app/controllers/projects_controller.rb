class ProjectsController < ApplicationController
    layout false
    
    def show
        render template: "projects/#{params[:project]}"
    end
end
