# Used for prefilling form values after validation errors
# Redirect will clear the form values - but that is not a good ux

module FormHelper
  def form_values
    flash[:form_values] ||= {}
  end

  def fetch(key)
    form_values.fetch(key, '')
  end

  def email
    fetch('email')
  end

  def first_name
    fetch('first_name')
  end

  def infix
    fetch('infix')
  end

  def last_name
    fetch('last_name')
  end

  def usertype
    fetch('usertype')
  end

  def password
    fetch('password')
  end

  def password_confirmation
    fetch('password_confirmation')
  end
end
