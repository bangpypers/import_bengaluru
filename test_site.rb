# Run after `bundle exec jekyll build`.
require "yaml"

html = File.read("_site/index.html")
event = YAML.load_file("_data/event.yml")
partners = YAML.load_file("_data/partners.yml")

raise "missing partner slides" unless html.scan("data-partner-slide>").size == partners.size
raise "missing BangPypers link" unless html.include?("https://bangalore.pythonindia.org/")
raise "wrong X link" unless html.include?("https://x.com/__bangpypers__")
raise "wrong contact email" unless html.scan("mailto:banglorepy@gmail.com").size == 2
raise "wrong favicon" unless html.include?("/Assets/logos/bangpypers.svg")
raise "missing mobile poster inset" unless html.include?("width: calc(100% - 1rem)")
raise "carousel interval changed" unless html.include?("5000")
([event.fetch("hero_image")] + partners.map { |partner| partner.fetch("image") }).each do |image|
  raise "missing image: #{image}" unless File.file?(image.delete_prefix("/"))
end

puts "Site checks passed"
