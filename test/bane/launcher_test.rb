require File.dirname(__FILE__) + '/../test_helper'
require 'mocha'

module Bane
  class FakeTestServer < BasicServer
  end
end

class LauncherTest < Test::Unit::TestCase
  
  def test_starts_single_server_on_specified_port
    target_port = 4000
    Bane::DelegatingGServer.expects(:new).with(equals(target_port), anything()).returns( stub_everything('fake_server') )

    launcher = Bane::Launcher.new(target_port, "FakeTestServer")
    launcher.start
  end

end