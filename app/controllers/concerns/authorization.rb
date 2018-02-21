module Authorization
  def current_ability
    @current_ability ||= begin
      case namespace
        when 'admin' then AdminAbility.new(current_user)
        else
          Ability.new(current_user)
      end
    end
  end
end
