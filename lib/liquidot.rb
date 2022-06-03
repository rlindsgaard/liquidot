require 'liquid'
module LiquiDot
  def self.format(raw_liquid, args=nil)
      template = Liquid::Template.parse(raw_liquid)
      template.render(args)
  end
end
