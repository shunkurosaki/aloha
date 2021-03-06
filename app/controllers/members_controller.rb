class MembersController < ApplicationController
  def index
    @member = Member.all
  end
  def show
    @member = Member.find(params[:id])
  end
  def new
    @member = Member.new
  end
  def create
    @member = Member.new(member_params)
    if @member.save
      sign_in @member
      redirect_to '/members'
    else
      render 'new'
    end
  end
  private
    def member_params
      params.require(:member).permit(:name, :password)
    end
end
