class MessagesController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @messages = @user.challenges.find_by_id(params[:challenge_id]).messages.all.order('created_at DESC')

    respond_to do |f|
      f.json {render json: {message: @messages}}
    end
  end

  def show
  end

  def new
    @message = Message.new

  end

  def create
    new_message = params.require(:message).permit(:text, :is_private, :is_caught, :is_confirmed, :is_invitation, :challenge_id)
    @user = current_user
    @message = @user.messages.create(new_message)

    respond_to do |f|
      f.json {render :json => {message: [@message]}}
      f.html
    end
  end

  def edit
  end

  def update
  end

  def delete
  end
end
