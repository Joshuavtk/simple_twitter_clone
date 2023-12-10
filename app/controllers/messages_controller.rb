class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  def index
    @messages = Message.all
    render json: @messages
  end

  def show
    render json: @message.to_json(include: [:user, :tags])
  end

  def create
    @message = Message.new(message_params)

    @message.tags << Tag.where(id: params[:tag_ids]) if params[:tag_ids].present?

    if @message.save
      render json: @message, notice: 'Message was successfully created.'
    else
      render json: "Error creating"
    end
  end

  def update
    @message.tags = Tag.where(id: params[:tag_ids]) if params[:tag_ids].present?

    if @message.update(message_params)
      render json: @message
    else
      render json: "Error updating"
    end
  end

  def destroy
    @message.destroy
    render json: 'Message was successfully destroyed.'
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id)
  end

end
