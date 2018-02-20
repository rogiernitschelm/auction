module ApplicationHelper
  def inline_roggers_svg(path)
    file = File.open("app/assets/stylesheets/roggers/svg/#{path}.svg", "rb")
    raw file.read
  end
end
