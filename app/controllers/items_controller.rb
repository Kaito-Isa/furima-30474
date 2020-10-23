class ItemsController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(item_params)
    if @user.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:user).permit(:nick_name, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date)
  end
end
