module Jekyll
  require 'slim'
  class HamlConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /slim/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      begin
        engine = Slim::Template.new() { content }
        engine.render
      rescue StandardError => e
          puts "!!! SLIM Error: " + e.message
      end
    end
  end
end
