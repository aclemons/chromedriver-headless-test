require 'selenium-webdriver'
require 'headless'

Selenium::WebDriver.logger.level = :debug
Selenium::WebDriver.logger.output = File.join(Dir.pwd, 'tmp', 'selenium.log')

# test file which opens something in a new tab
file = "file://#{File.join(Dir.pwd, 'test.html')}"

@headless = Headless.new(:dimensions => "1280x1600x24", :display => 5, :reuse => false)
@headless.start

at_exit do
  @headless.destroy if @headless
end

capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(chrome_options: { args: %w(--headless --disable-gpu window-size=1200x800), binary: '/usr/bin/chromium' }) # /usr/bin/google-chrome-beta

@driver = Selenium::WebDriver.for(:chrome, desired_capabilities: capabilities, driver_opts: { args: %w(--verbose --log-path=tmp/chromedriver.log) })

@driver.navigate.to(file)
@driver.find_element(:link_text, 'New Tab').click

@driver.switch_to.window(@driver.window_handles.last)
@driver.save_screenshot("tmp/#{Time.now.to_i}.png")
