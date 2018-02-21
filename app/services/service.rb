class Service
  def self.run(*args, **kwargs)
    instance = if !kwargs.empty?
      self.new(*args, **kwargs)
    else
      self.new(*args)
    end

    instance.run
    instance
  end
end
