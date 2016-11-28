require 'user_agent_parser'
require 'addressable'
require 'browser'

class EnhanceRequest
  attr_reader :request, :params

  REQUEST_KEYS = [:ip, :user_agent, :referrer, :landing_page]
  TRAFFIC_SOURCE_KEYS = [:referring_domain]
  TECHNOLOGY_KEYS = [:browser, :os, :device_type]

  KEYS = REQUEST_KEYS + TRAFFIC_SOURCE_KEYS + TECHNOLOGY_KEYS

  def initialize(request)
    @request = request
    @params = request.params
  end

  def to_hash
    KEYS.inject({}) { |memo, key| memo[key] = send(key); memo }
  end

  def ip
    request.remote_ip
  end

  def user_agent
    request.user_agent
  end

  def referrer
    request.referer
  end

  def landing_page
    request.original_url
  end

  def referring_domain
    Addressable::URI.parse(referrer).host.first(255) rescue nil
  end

  def browser
    agent.name
  end

  def os
    agent.os.name
  end

  def device_type
    begin

      if browser_parser.bot?
        "Bot"
      elsif browser_parser.device.tv?
        "TV"
      elsif browser_parser.device.console?
        "Console"
      elsif browser_parser.device.tablet?
        "Tablet"
      elsif browser_parser.device.mobile?
        "Mobile"
      else
        "Desktop"
      end
    end
  end

  protected

  def agent
    user_agent_parser.parse(user_agent)
  end

  def browser_parser
    @browser ||= Browser.new(user_agent)
  end

  def user_agent_parser
    @user_agent_parser ||= UserAgentParser::Parser.new
  end
end
