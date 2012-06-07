require 'spec_helper'

describe SessionsController, '#create' do
  it 'does not require login' do
    stub_omniauth_env
    post :create
    should_not deny_access
  end

  private

  def stub_omniauth_env
    request.env['omniauth.auth'] = OmniAuth.mock_auth_for(:yammer)
  end
end