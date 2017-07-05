class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :require_admin, if: :devise_controller?
  before_action :create_permissions

  private

  def require_admin
  	@admin = current_admin
  	redirect_to root_path unless @admin.present?
  end

  def create_permissions
  	CreatePermissions.new.company unless CompanyPermission.count > 0
  	CreatePermissions.new.merchant unless MerchantPermission.count > 0
  end

  def load_permission_names
    @role_permission_names = []
    if @role != "Admin" && company_user_signed_in?
      @role.company_permissions.each do |cp|
        @role_permission_names << cp.name
      end
      return @role_permission_names
    elsif @role != "Admin" && merchant_user_signed_in?
      @role.merchant_permissions.each do |mp|
        @role_permission_names << mp.name
      end
      return @role_permission_names
    end
  end 

  def determine_user_role
    if admin_signed_in?
      @role = "Admin"
    elsif company_user_signed_in?
      @role = CompanyRole.find_by_id(current_company_user.company_role_id)
    elsif merchant_user_signed_in?
      @role = MerchantRole.find_by_id(current_merchant_user.merchant_role_id)
    else
      @role = nil
    end
  end

end
