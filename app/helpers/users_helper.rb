module UsersHelper
  def get_user_role role
    user_role = {
      admin: 'Administrador',
      instance: 'Instancia',
      responsible: 'Responsable',
      instructor: 'Instructor'
    }
    user_role[role.to_sym]
  end

end
