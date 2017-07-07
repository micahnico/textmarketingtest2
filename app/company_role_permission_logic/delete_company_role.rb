class DeleteCompanyRole < CompanyRolePermissionLogic
  def check
    return true if @permission_set.include?( CompanyPermission.find_by(id: 8) )
  end
end