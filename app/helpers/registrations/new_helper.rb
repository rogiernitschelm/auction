module Registrations::NewHelper
  def selectable_usertypes
    [
      [t('activerecord.models.buyer', count: 1), :buyer],
      [t('activerecord.models.seller', count: 1), :seller]
    ]
  end
end
