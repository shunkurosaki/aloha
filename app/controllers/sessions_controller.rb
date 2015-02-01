class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by(name: params[:session][:name].downcase)
    # if member && member.authenticate(params[:session][:password])
      sign_in member
      redirect_to '/members'
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
