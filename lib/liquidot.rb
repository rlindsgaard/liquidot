require 'liquid'
require 'yaml'

module LiquiDot
  class Template
    def initialize(content, data={})
      @content = content
      @data = data
    end

    def self.parse(filename)
      s = File.read(filename)
      self.parse_string(s)
    end

    def self.parse_string(content)
      data = {}
      if content =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
        content = $POSTMATCH
        data    = YAML.load($1)
      end
      Template.new(content, data)
    end

    def render(newdata={})
      template = Liquid::Template.parse(@content)
      data = @data
      if !data.empty?
        data.merge!(newdata)
      end
      template.render(data)
    end
  end
end
