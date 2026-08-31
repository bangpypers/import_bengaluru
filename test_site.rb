# Run after `bundle exec jekyll build`.
require "yaml"

html = File.read("_site/index.html", encoding: "UTF-8")
event = YAML.load_file("_data/event.yml")
partners = YAML.load_file("_data/partners.yml")
sponsors = YAML.load_file("_data/sponsors.yml")

raise "missing partner slides" unless html.scan("data-partner-slide>").size == partners.size
raise "missing BangPypers link" unless html.include?("https://bangalore.pythonindia.org/")
raise "wrong X link" unless html.include?("https://x.com/__bangpypers__")
raise "wrong contact email" unless html.scan("mailto:banglorepy@gmail.com").size == 1
raise "wrong favicon" unless html.include?("/Assets/logos/bangpypers.svg")
raise "wrong venue logo" unless html.include?("/Assets/logos/InMobi_Glance_Color.png")
sponsors.each do |sponsor|
  raise "missing sponsor" unless html.include?(sponsor.fetch("name")) && html.include?(sponsor.fetch("url"))
  raise "missing sponsor logo" unless File.file?(sponsor.fetch("image").delete_prefix("/"))
end
raise "missing venue map" unless html.include?("https://www.google.com/maps/embed?pb=")
raise "missing mobile poster inset" unless html.include?("width: calc(100% - 1rem)")
raise "carousel interval changed" unless html.include?("5000")
([event.fetch("hero_image")] + partners.map { |partner| partner.fetch("image") }).each do |image|
  raise "missing image: #{image}" unless File.file?(image.delete_prefix("/"))
end

puts "Site checks passed"
