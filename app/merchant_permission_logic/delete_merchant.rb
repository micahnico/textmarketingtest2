class DeleteMerchant < MerchantPermissionLogic
  def check
    return true if @permission_set.include?( CompanyPermission.find_by(id: 12) )
  end
end