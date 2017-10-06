class GroupWatchersController < ApplicationController
  before_action :find_project

  def new
    @users = users_for_new_watcher

    @groups = Group.all
    @groups.each do |group|
      group.users.select do |user|
        @users.find { |u| u.id == user.id }
      end
    end
  end

  def find_project
    if params[:object_type] && params[:object_id]
      @watchables = find_objets_from_params
      @projects = @watchables.map(&:project).uniq
      if @projects.size == 1
        @project = @projects.first
      end
    elsif params[:project_id]
      @project = Project.visible.find_by_param(params[:project_id])
    end
  end

  def users_for_new_watcher
    scope = nil
    if params[:q].blank? && @project.present?
      scope = @project.users
    else
      scope = User.all.limit(100)
    end
    users = scope.active.visible.sorted.like(params[:q]).to_a
    if @watchables && @watchables.size == 1
      users -= @watchables.first.watcher_users
    end
    users
  end
end
