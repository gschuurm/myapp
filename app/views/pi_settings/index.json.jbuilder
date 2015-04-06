json.array!(@pi_settings) do |pi_setting|
  json.extract! pi_setting, :id, :display, :capture, :album
  json.url pi_setting_url(pi_setting, format: :json)
end
