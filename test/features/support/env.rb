require 'rspec/expectations'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require "json_spec/cucumber"
require 'nokogiri'

if ENV['IN_BROWSER']
  Capybara.default_driver = :selenium
  AfterStep do
    sleep (ENV['PAUSE'] || 0).to_i
  end
else
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
      app,
      window_size: [1280, 1024]
    )
  end
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist
end

Capybara.default_selector = :css
World(RSpec::Matchers)

# configure the base urls for frontend and backend here
$app_base_url     = ENV['APP_BASE_URL']         || 'http://127.0.0.1:3000'
$assembly_version = ENV['APP_ASSEMBLY_VERSION'] || '0.4.1.22'

def app_url(path)
  $app_base_url + path
end

def last_json  
  Nokogiri::HTML.parse(page.body).content
end

# file with database fixtures
$fixtures = 'features/support/fixtures.json'
