require 'liquid'
require 'yaml'

module LiquiDot
  def self.format(raw_liquid, args=nil)
      if raw_liquid =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
        raw_liquid = $POSTMATCH
        data    = YAML.load($1)
      end
      template = Liquid::Template.parse(raw_liquid)
      template.render(data)
  end
end
