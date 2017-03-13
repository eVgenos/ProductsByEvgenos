class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize

  def index
    @products = Product.all.size
    @categories = Category.all.size
    @users = User.all.size
  end

  def edit_products

  end

  def edit_categories

  end

  def edit_users
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.remove_role @user.roles.first.name
    @new_role = params[:role]
    @user.add_role @new_role
    redirect_to edit_users_path
  end

  private

  def authorize
    if !current_user.has_role? :admin
      render text:"No access for you!"
    end
  end
end
