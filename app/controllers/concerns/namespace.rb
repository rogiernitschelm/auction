module Namespace
  def namespace
    case self.class.parent.to_s.downcase
      when 'admin' then 'admin'
      when 'seller' then 'seller'
      when 'buyer' then 'buyer'
      else ''
    end
  end
end
