class AdminsController < ApplicationController
  def edit
    @admin = current_admin
  end

  def update
    @admin = Admin.find(current_admin.id)
    if @admin.update(admin_params)
      sign_in @admin, bypass: true
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:password, :password_confirmation)
  end
end
