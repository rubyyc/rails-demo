class IssuesController < ApplicationController
  def show
    #render plain: params[:id].inspect
    @issue = Issue.find(params[:format])

    @comments = @issue.comments

  end

  def destory
    i = Issue.find(params[:format])
    i.destroy
    redirect_to :root
  end

  def new
    if not current_user
      flash[:notice] = "请先登录"
      redirect_to :root
    else
      @issue = Issue.new
    end

  end

  def create
    #render plain: params[:issue].inspect
    Issue.create(issue_params)
    redirect_to :root
  end

  def edit
    @issue = Issue.find(:format)
  end

  def update
    i = Issue.find(params[:format])
    i.update_attributes(issue_params)
    redirect_to :root
  end

  private
    def issue_params
      params.require(:issue).permit(:title,:content,:user_id)
    end
end
